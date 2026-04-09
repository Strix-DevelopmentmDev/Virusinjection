local isInfected = false
local currentStage = 0

local function LoadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

local function GetClosestPlayer()
    local players = GetActivePlayers()
    local closestPlayer = -1
    local closestDistance = -1
    local myPed = PlayerPedId()
    local myCoords = GetEntityCoords(myPed)

    for _, player in ipairs(players) do
        local targetPed = GetPlayerPed(player)
        if targetPed ~= myPed then
            local targetCoords = GetEntityCoords(targetPed)
            local dist = #(myCoords - targetCoords)

            if closestDistance == -1 or dist < closestDistance then
                closestDistance = dist
                closestPlayer = player
            end
        end
    end

    return closestPlayer, closestDistance
end

RegisterNetEvent('virus:tryInjectNearest', function()
    local closestPlayer, closestDistance = GetClosestPlayer()

    if closestPlayer == -1 or closestDistance > Config.InjectDistance then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            args = {"Virus", "No player nearby."}
        })
        return
    end

    TriggerServerEvent('virus:server:injectTarget', GetPlayerServerId(closestPlayer))
end)

RegisterNetEvent('virus:client:doInjectorAnim', function()
    local ped = PlayerPedId()
    LoadAnimDict("melee@knife@streamed_core")
    TaskPlayAnim(ped, "melee@knife@streamed_core", "ground_attack_on_spot", 8.0, -8.0, 2500, 1, 0, false, false, false)
    Wait(2500)
    ClearPedTasks(ped)
end)

RegisterNetEvent('virus:client:getInjected', function()
    local ped = PlayerPedId()
    LoadAnimDict("reaction@intimidation@1h")
    TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, -8.0, 1800, 1, 0, false, false, false)
    Wait(1800)
    ClearPedTasks(ped)
end)

local function DoVomit()
    local ped = PlayerPedId()
    LoadAnimDict("missfam5_blackout")
    TaskPlayAnim(ped, "missfam5_blackout", "vomit", 8.0, -8.0, 5000, 1, 0, false, false, false)
    Wait(5000)
    ClearPedTasks(ped)
end

local function DoItch()
    local ped = PlayerPedId()
    LoadAnimDict("move_m@_idles@shake_off")
    TaskPlayAnim(ped, "move_m@_idles@shake_off", "shakeoff_1", 8.0, -8.0, 2500, 1, 0, false, false, false)
    Wait(2500)
    ClearPedTasks(ped)
end

local function DoFaint()
    local ped = PlayerPedId()
    DoScreenFadeOut(1000)
    Wait(3000)
    DoScreenFadeIn(1000)
    SetPedToRagdoll(ped, 4000, 4000, 0, false, false, false)
    Wait(4000)
end

local function DoPassOut()
    local ped = PlayerPedId()
    ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.5)
    AnimpostfxPlay("DrugsMichaelAliensFightIn", 5000, false)
    DoScreenFadeOut(1500)
    Wait(5000)
    DoScreenFadeIn(1500)
    AnimpostfxStop("DrugsMichaelAliensFightIn")
    SetPedToRagdoll(ped, 6000, 6000, 0, false, false, false)
    Wait(6000)
end

local function StartStage1()
    currentStage = 1

    CreateThread(function()
        while isInfected and currentStage == 1 do
            DoVomit()
            Wait(15000)
            DoItch()
            Wait(30000)
        end
    end)
end

local function StartStage2()
    currentStage = 2

    CreateThread(function()
        local lastFaint = GetGameTimer()

        while isInfected and currentStage == 2 do
            DoItch()
            Wait(10000)

            DoVomit()
            Wait(60000)

            if GetGameTimer() - lastFaint >= 300000 then
                DoFaint()
                lastFaint = GetGameTimer()
            end
        end
    end)
end

local function StartStage3()
    currentStage = 3

    CreateThread(function()
        while isInfected and currentStage == 3 do
            ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.3)
            DoItch()
            Wait(8000)
            DoVomit()
            Wait(12000)
            DoFaint()
            Wait(15000)
            DoPassOut()
            Wait(15000)
        end
    end)

     CreateThread(function()
        Wait(Config.Stage3DeathTime * 1000)
        if isInfected and currentStage == 3 then
            SetEntityHealth(PlayerPedId(), 0)
            isInfected = false
            currentStage = 0
        end
    end)
end

RegisterNetEvent('virus:client:startInfection', function()
    if isInfected then return end

    isInfected = true
    currentStage = 0

    StartStage1()

    CreateThread(function()
        Wait(Config.Stage1Time * 1000)
        if isInfected then
            StartStage2()
        end

        Wait(Config.Stage2Time * 1000)
        if isInfected then
            StartStage3()
        end
RegisterCommand("testvirus", function()
    if isInfected then
        print("already infected")
        return
    end
RegisterCommand("testvirus", function()
    print("TEST VIRUS TRIGGERED")

    TriggerEvent('virus:client:startInfection')
end, false)

    print("starting virus test on self")
    TriggerEvent('virus:client:startInfection')
end)
    end)
end)