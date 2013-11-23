local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 100) -- time in seconds x1000

function onUse(cid, item, fromPosition, itemEx, toPosition)

   if(hasCondition(cid, CONDITION_EXHAUST)) then
     doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
     doPlayerSendCancel(cid, "You are exhausted")
     return true
   end
   doPlayerAddMana(cid, math.random(1000, 10000))  --parameter for total mana healed
   doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
   doAddCondition(cid, exhaust)
   return true
end