-----------------------------------
-- Ability: Nightingale
-- Game Description: Halves the casting and recast times of songs
-- Obtained: Bard Level 75 Group 2 Meriting
-- Recast Time: 0:10:00
-- Duration: 0:01:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.bard.useNightingale(player, target, ability)
end

return abilityObject
