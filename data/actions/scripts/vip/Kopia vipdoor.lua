function onUse(cid, item, frompos, item2, topos)
local storageValue = 21444
vipstatus = getPlayerStorageValue(cid,storageValue)


if vipstatus == 1 then

doTransformItem(item.uid, item.itemid + 1)

playerpos = getPlayerPosition(cid)

doorpos = {x = frompos.x, y = frompos.y, z = frompos.z, stackpos = 253}

if playerpos.y == doorpos.y + 1 and playerpos.x == doorpos.x then

doMoveCreature(cid, 0)

elseif playerpos.x == doorpos.x - 1 and playerpos.y == doorpos.y then

doMoveCreature(cid, 1)

elseif playerpos.y == doorpos.y - 1 and playerpos.x == doorpos.x then

doMoveCreature(cid, 2)

elseif playerpos.y == doorpos.y and playerpos.x == doorpos.x + 1 then

doMoveCreature(cid, 3)

elseif playerpos.x == doorpos.x + 1 and playerpos.y == doorpos.y - 1 then

doMoveCreature(cid, 4)

elseif playerpos.x == doorpos.x - 1 and playerpos.y == doorpos.y - 1 then

doMoveCreature(cid, 5)

elseif playerpos.x == doorpos.x + 1 and playerpos.y == doorpos.y + 1 then

doMoveCreature(cid, 6)

elseif playerpos.x == doorpos.x - 1 and playerpos.y == doorpos.y + 1 then

doMoveCreature(cid, 7)

end

else
doCreatureSay(cid, "You dont have a Vip Access.", TALKTYPE_ORANGE_1)
end

return 1

end