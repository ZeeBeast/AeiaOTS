 function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.uid == 2378 then
                queststatus = getPlayerStorageValue(cid, 2378)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found 4 premium tokens.")
                        doPlayerAddItem(cid, 2160, 100)
                        doPlayerSetStorageValue(cid, 11424, 1)
                        doPlayerSetStorageValue(cid, 11424, 1)
                        doPlayerSetStorageValue(cid, 11424, 1)
                        doPlayerSetStorageValue(cid, 11424, 1)
                        doPlayerSetStorageValue(cid, 11424, 1)
                        doPlayerSetStorageValue(cid, 11424, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end
end
    return true
end
