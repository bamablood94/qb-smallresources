local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-robparking:server:sp1d3r1987')
AddEventHandler('qb-robparking:server:sp1d3r1987', function(count)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local data = {
        worth = math.random(Config.MoneyMin,Config.MoneyMax)
    }
    Player.Functions.AddMoney("cash", data.worth)
    --TriggerClientEvent('QBCore:Notify', src, "You got $"..data.worth.." from the parking meter", "success", 5000)
    TriggerClientEvent('okokNotify:Alert', src, 'Successful!', 'You got $'..data.worth..' from the parking meter.', 5000, 'success')
end)

RegisterServerEvent('qb-parkingmetercall')
AddEventHandler('qb-parkingmetercall', function(data, customcoords)
    if customcoords ~= nil then data.coords = customcoords end
    TriggerClientEvent('cd_dispatch:AddNotification', -1, {
        job = 'police',
        coords = data.coords,
        title = '10-90 - Parking Meter Robbery',
        message = 'A '..data.sex..' was seen breaking a parking meter at '..data.street_1..', '..data.street_2,
        flash = 0,
        blip = {
            sprite = 635,
            scale = 1.0,
            colour = 1,
            flashes = false,
            text = '911 - Parking Meter Robbery',
            time = (10*60*1000),
            sound = 1,
        }
    })
end)
