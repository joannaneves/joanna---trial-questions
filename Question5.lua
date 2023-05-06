local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, OMBAT_ICEDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, 204)
combat1:setFormula(COMBAT_FORMULA_LEVELMAGIC, -55.2, 1, -55.2, 1)
local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, OMBAT_ICEDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 137)
combat2:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.2, 1, -1.2, 1)

local area1 = {
    { 0, 0, 0, 0, 0 },
    { 0, 1, 1, 1, 0 },
    { 0, 1, 3, 1, 0 },
    { 0, 1, 1, 1, 0 },
    { 0, 0, 0, 0, 0 }
}
local area2 = {
    { 1, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0 },
    { 0, 0, 2, 0, 0 },
    { 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0 }
}

combat1:setArea(createCombatArea(area1))
combat2:setArea(createCombatArea(area2))

local function onCastSpell1(param)
    return isPlayer(param.cid) and combat:execute(param.cid, param.combat1, param.var)
end

local function onCastSpell2(param)
    return isPlayer(param.cid) and combat:execute(param.cid, param.combat2, param.var)
end

function onCastSpell(creature, variant)
    local param = { cid = cid, var = var }
    addEvent(onCastSpell1, 100, param)
    addEvent(onCastSpell2, 200, param)
    return true
end

spell = {
    { type_ = "instant", name = "Iced Tornado", words = "frigo", level = 60, mana = 1200, vocs = { 3, 7 } },
}
--[[This code creates two Combat objects, combat1 and combat2. It sets parameters for each of the objects, such as type, effect, and formula.
It then creates two areas, area1 and area2, which are used to define the shape of the combat. Finally, it creates a spell called "Iced Tornado"
with certain properties.
Iced Tornado is an instant spell introduced in level 60, with a mana cost of 1200. It is available to vocations 3 and 7, and when cast,
it deals an area of effect icedamage. It has also an effect of 204 and another effect of 137.
]]
--
