QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('targetevent:server:watercooler', function ()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('water_bottle', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['water_bottle'], 'add')
end)