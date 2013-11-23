-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat0_holy = createCombatObject()
setCombatParam(combat0_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat0_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat0_holy,createCombatArea({{2}}))
function getDmg_holy(cid, level, maglevel)
	return (1000)*-1,(1500)*-1 
end
setCombatCallback(combat0_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")
local dfcombat0_holy = {CONST_ANI_SMALLHOLY}local combat0_Brush = createCombatObject()
setCombatParam(combat0_Brush, COMBAT_PARAM_EFFECT, CONST_ME_LOSEENERGY)
setCombatParam(combat0_Brush, COMBAT_PARAM_TYPE, COMBAT_LIFEDRAIN)
setCombatArea(combat0_Brush,createCombatArea({{1, 1, 1, 1, 1, 1, 1, 1},
{1, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 2, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 1},
{1, 1, 1, 1, 1, 1, 1, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (1000)*-1,(1400)*-1 
end
setCombatCallback(combat0_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

-- Areas/Combat for 200ms
local combat2_Brush = createCombatObject()
setCombatParam(combat2_Brush, COMBAT_PARAM_EFFECT, CONST_ME_LOSEENERGY)
setCombatParam(combat2_Brush, COMBAT_PARAM_TYPE, COMBAT_LIFEDRAIN)
setCombatArea(combat2_Brush,createCombatArea({{1, 1, 1, 1, 1, 1},
{1, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 1},
{1, 0, 2, 0, 0, 1},
{1, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 1},
{1, 1, 1, 1, 1, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (1000)*-1,(1400)*-1 
end
setCombatCallback(combat2_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

-- Areas/Combat for 600ms
local combat6_Brush = createCombatObject()
setCombatParam(combat6_Brush, COMBAT_PARAM_EFFECT, CONST_ME_LOSEENERGY)
setCombatParam(combat6_Brush, COMBAT_PARAM_TYPE, COMBAT_LIFEDRAIN)
setCombatArea(combat6_Brush,createCombatArea({{1, 1},
{2, 1},
{1, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (1000)*-1,(1400)*-1 
end
setCombatCallback(combat6_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

-- Areas/Combat for 400ms
local combat4_Brush = createCombatObject()
setCombatParam(combat4_Brush, COMBAT_PARAM_EFFECT, CONST_ME_LOSEENERGY)
setCombatParam(combat4_Brush, COMBAT_PARAM_TYPE, COMBAT_LIFEDRAIN)
setCombatArea(combat4_Brush,createCombatArea({{1, 1, 1, 1},
{1, 0, 0, 1},
{1, 2, 0, 1},
{1, 0, 0, 1},
{1, 1, 1, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (1000)*-1,(1400)*-1 
end
setCombatCallback(combat4_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

-- =============== CORE FUNCTIONS ===============
local function RunPart(c,cid,var,dirList,dirEmitPos) -- Part
	if (isCreature(cid)) then
		doCombat(cid, c, var)
		if (dirList ~= nil) then -- Emit distance effects
			local i = 2;
			while (i < #dirList) do
				doSendDistanceShoot(dirEmitPos,{x=dirEmitPos.x-dirList[i],y=dirEmitPos.y-dirList[i+1],z=dirEmitPos.z},dirList[1])
				i = i + 2
			end		
		end
	end
end

function onCastSpell(cid, var)
	local startPos = getCreaturePosition(cid)
	RunPart(combat0_holy,cid,var,dfcombat0_holy,startPos)
	RunPart(combat0_Brush,cid,var)
	addEvent(RunPart,200,combat2_Brush,cid,var)
	addEvent(RunPart,600,combat6_Brush,cid,var)
	addEvent(RunPart,400,combat4_Brush,cid,var)
	return true
end