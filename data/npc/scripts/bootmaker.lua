local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'soft') or msgcontains(msg, 'boots')) then
		selfSay('Do you want to fix worn soft boots for 10,000 gold coins?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if(getPlayerItemCount(cid, 6530) >= 1) then
			if(doPlayerRemoveMoney(cid, 10000)) then
				local item = getPlayerItemById(cid, true, 6530)
				doTransformItem(item.uid, 6132)
				selfSay('Done.', cid)
			else
				selfSay('You do not have enough money.', cid)
			end
		elseif(getPlayerItemCount(cid, 10021) >= 1) then
			if(doPlayerRemoveMoney(cid, 10000)) then
				local item = getPlayerItemById(cid, true, 10021)
				doTransformItem(item.uid, 6132)
				selfSay('Done', cid)
			else
				selfSay('You do not have enough money.', cid)
			end
		else
			selfSay('I\'m sorry, you do not have the item.', cid)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
