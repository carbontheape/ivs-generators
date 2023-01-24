QBCore = exports['qb-core']:GetCoreObject()
inGeneratorArea = nil
inZone = false

Citizen.CreateThread(function()
    local zones = {}
    for _, v in pairs(Config.Generators) do
        zones[#zones+1] = BoxZone:Create(
            v.coords, v.length, v.width, {
            name = 'power_generator',
            heading = v.heading,
            minZ = v.minz,
            maxZ = v.maxz,
            debugPoly = false,
        })
    end

    local generatorCombo = ComboZone:Create(zones, {name = "generatorCombo", debugPoly = false})
    generatorCombo:onPlayerInOut(function(isPointInside, _, zone)
        if isPointInside then
            zoneName = zone.name
            inZone = true
            inGeneratorArea = true
            TriggerEvent('ivs-generator:client:blackoutstatus')
            for i = 1, 5 do
                Citizen.Wait(200)
                PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
            end
            Wait(5)
            print('entered zone')
        else
            inZone = false
            inGeneratorArea = false
            TriggerEvent('ivs-generator:client:blackoutstatus')
            print(inZone)
        end
        Wait(5)
    end)
end)

RegisterNetEvent('ivs-generator:client:blackoutstatus', function()
    QBCore.Functions.TriggerCallback('ivs-generator:server:activeblackout', function(state)
        if state then
            if not inGeneratorArea then
                SetArtificialLightsState(true)
            else
                SetArtificialLightsState(false)
            end
        end
    end)
end)

Citizen.CreateThread(function()
    while true do
        while not inZone do
            QBCore.Functions.TriggerCallback('ivs-generator:server:activeblackout', function(state)
                if not state then
                    SetArtificialLightsState(false)
                else
                    SetArtificialLightsState(true)
                end
            end)
            Wait(500)
        end
    Wait(5000)
    end
end)
