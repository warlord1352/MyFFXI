-----------------------------------
-- Thunderstorm
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local tp = pet:getTP()

    -- Merit TP bonus.
    local merits = 0

    if summoner and summoner:isPC() then
        merits = summoner:getMerit(xi.merit.THUNDERSTORM)
    end

    tp = utils.clamp(tp + merits - 400, 0, 3000)

    --note: this formula is only accurate for level 75 - 76+ may have a different intercept and/or slope
    local damage = math.floor(256 + 0.172 * tp + pet:getStat(xi.mod.INT) - target:getStat(xi.mod.INT))

    damage = xi.mobskills.mobMagicalMove(pet, target, petskill, damage, xi.element.THUNDER, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = xi.mobskills.mobAddBonuses(pet, target, damage.dmg, xi.element.THUNDER, petskill)
    damage = xi.summon.avatarFinalAdjustments(damage, pet, petskill, target, xi.attackType.MAGICAL, xi.damageType.THUNDER, 1)

    target:takeDamage(damage, pet, xi.attackType.MAGICAL, xi.damageType.THUNDER)
    target:updateEnmityFromDamage(pet, damage)

    return damage
end

return abilityObject
