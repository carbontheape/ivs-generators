local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback("ivs-generator:server:activeblackout", function(source, cb)
    local state = exports["qb-weathersync"]:getBlackoutState()
    if state then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('ivs-generator:server:blackoutserver', function(data)
    TriggerClientEvent('ivs-generator:client:blackoutserver')
end)