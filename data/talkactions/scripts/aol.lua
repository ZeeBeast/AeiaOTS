function onSay(cid, words, param)
if doPlayerRemoveMoney(cid, 5000) == TRUE then
doPlayerAddItem(cid, 2173, 1)
doPlayerSendTextMessage(cid, 19,"You bought an AOL for 50k.")
doSendMagicEffect(getPlayerPosition(cid), 19)
else
doPlayerSendCancel(cid, "Sorry,Sorry, Aol is 50k.")
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end