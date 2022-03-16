local QBCore = exports['qb-core']:GetCoreObject()

local HaveBagOnHead = false

RegisterNetEvent('qb-headbag:putOn') 
AddEventHandler('qb-headbag:putOn', function()
    local closestplayer = GetClosestPlayer(3)
    local target = GetPlayerServerId(closestplayer)
    local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
    if target ~= 0 then
        TriggerServerEvent("qb-handbag:MaskPlayer", target)
    else
        QBCore.Functions.Notify("There's no one nearby!", "error")
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if HaveBagOnHead then
            DisableControlAction(0, 246, true) 
            DisableControlAction(0, 245, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
        end
    end
end)

RegisterNetEvent('qb-handbag:GetMasked', function(playerId)
	if not HaveBagOnHead then
        LocalPlayer.state:set("inv_busy", true, true)
		Worek = CreateObject(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true) -- Create head bag object!
		AttachEntityToEntity(Worek, PlayerPedId(-1), GetPedBoneIndex(PlayerPedId(-1), 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- Attach object to head
		
		SetNuiFocus(false,false)
		SendNUIMessage({type = 'openGeneral'})
		HaveBagOnHead = true
    else
	    LocalPlayer.state:set("inv_busy", false, true)
        DeleteEntity(Worek)
        SetEntityAsNoLongerNeeded(Worek)
        SendNUIMessage({type = 'closeAll'})
        HaveBagOnHead = false
        QBCore.Functions.Notify("You can see now !!", "success")
    end
end)


function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end


function GetClosestPlayer(radius)
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
	--print("closest player is dist: " .. tostring(closestDistance))
	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end
