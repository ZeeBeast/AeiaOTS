local config = {
	broadcast = {120, 30},
	flags = 13,
	delay = 120,
	events = 30
}

local function executeSave(seconds)
	if(isInArray(config.broadcast, seconds)) then
		doBroadcastMessage("[Server]: Server save within " .. seconds .. " seconds, please mind it may freeze!", MESSAGE_STATUS_CONSOLE_BLUE)
	end

	if(seconds > 0) then
		addEvent(executeSave, config.events * 1000, seconds - config.events)
	else
		doSaveServer(config.flags)
		doBroadcastMessage("[Server]: Server is now going to save.", MESSAGE_STATUS_CONSOLE_BLUE)
	end
end

function onThink(interval)
	if(table.maxn(config.broadcast) == 0) then
		doSaveServer(config.flags)
	else
		executeSave(config.delay)
		doBroadcastMessage("[Server]: Server saved.", MESSAGE_STATUS_CONSOLE_BLUE)
	end

	return true
end
