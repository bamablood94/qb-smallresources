NodusCore = exports['nodus-core']:GetCoreObject()

RegisterServerEvent('oxydelivery:server')
AddEventHandler('oxydelivery:server', function()
	local player = NodusCore.Functions.GetPlayer(source)

	if player.PlayerData.money['cash'] >= Config.StartOxyPayment then
		player.Functions.RemoveMoney('cash', Config.StartOxyPayment)

		TriggerClientEvent("oxydelivery:startDealing", source)
	else
		TriggerClientEvent('NodusCore:Notify', source, 'You dont have enough money', 'error')
	end
end)

RegisterServerEvent('oxydelivery:receiveBigRewarditem')
AddEventHandler('oxydelivery:receiveBigRewarditem', function()
	local player = NodusCore.Functions.GetPlayer(source)

	player.PlayerData.AddItem(Config.BigRewarditem, 1)
	TriggerClientEvent('inventory:client:ItemBox', source, NodusCore.Shared.Items[Config.BigRewarditem], "add")
end)

RegisterServerEvent('oxydelivery:receiveoxy')
AddEventHandler('oxydelivery:receiveoxy', function()
	local Player = NodusCore.Functions.GetPlayer(source)

	Player.Functions.AddMoney('cash', Config.Payment / 2)
	Player.Functions.AddItem(Config.Item, Config.OxyAmount)
	TriggerClientEvent('inventory:client:ItemBox', source, NodusCore.Shared.Items[Config.Item], "add")
	local Chance = math.random(100)
	if Chance > 96 then
		Player.Functions.AddItem("weedkey", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, NodusCore.Shared.Items["weedkey"], 'add', 1)
		TriggerClientEvent('NodusCore:Notify', src, "You found a strange key!", "success")
	end
end)

RegisterServerEvent('oxydelivery:receivemoneyyy')
AddEventHandler('oxydelivery:receivemoneyyy', function()
	local Player = NodusCore.Functions.GetPlayer(source)

	Player.Functions.AddMoney('cash', Config.Payment)
end)

RegisterServerEvent('nodus-oxycall')
AddEventHandler('nodus-oxycall', function(data, customcoords)
    if customcoords ~= nil then data.coords = customcoords end
    TriggerClientEvent('cd_dispatch:AddNotification', -1, {
        job = 'police',
        coords = data.coords,
        title = 'Oxy Sale',
        message = 'A '..data.sex..' seen selling oxy at '..data.street,
        flash = 0,
        blip = {
            sprite = 431,
            scale = 1.2,
            colour = 3,
            flashes = false,
            text = '911 - Oxy Sale',
            time = (3*60*1000),
            sound = 1,
        }
    })
end)
