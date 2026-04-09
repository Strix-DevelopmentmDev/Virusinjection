math.randomseed(os.time())

RegisterCommand(Config.InjectCommand, function(source)
    TriggerClientEvent('virus:tryInjectNearest', source)
end, false)

RegisterNetEvent('virus:server:injectTarget', function(targetId)
    local src = source
    if not targetId then return end
    if GetPlayerPing(targetId) <= 0 then return end

    -- play anims
    TriggerClientEvent('virus:client:doInjectorAnim', src)
    TriggerClientEvent('virus:client:getInjected', targetId)

    local roll = math.random(1, 100)

    if roll <= Config.InfectionChance then
        -- SUCCESS
        TriggerClientEvent('virus:client:startInfection', targetId)

        TriggerClientEvent('chat:addMessage', src, {
            color = {255, 0, 0},
            args = {"Virus", "Target infected"}
        })

        TriggerClientEvent('chat:addMessage', targetId, {
            color = {255, 0, 0},
            args = {"Virus", "You feel sick..."}
        })

    else
        -- FAILED
        TriggerClientEvent('chat:addMessage', src, {
            color = {255, 255, 0},
            args = {"Virus", "Injection failed"}
        })

        TriggerClientEvent('chat:addMessage', targetId, {
            color = {255, 255, 0},
            args = {"Virus", "Nothing happened"}
        })
    end
end)