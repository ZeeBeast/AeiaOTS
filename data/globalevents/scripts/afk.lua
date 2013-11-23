  function onThink(interval, lastExecution, thinkInterval)
for _, pid in ipairs(getPlayersOnline()) do
    if getPlayerIdleTime(pid) > 5 * 60 * 1000 then
         doSendAnimatedText(getCreaturePosition(pid), "AFK", TEXTCOLOR_WHITE)
    end
end
return TRUE
end 