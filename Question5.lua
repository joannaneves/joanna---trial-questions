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
