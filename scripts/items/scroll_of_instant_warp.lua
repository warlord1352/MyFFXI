-----------------------------------
-- ID: 4181
-- Scroll of Instant Warp
-- Transports the user to their Home Point
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.WARP, 0, 3)
end

return itemObject
