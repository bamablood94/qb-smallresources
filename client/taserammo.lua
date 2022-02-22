local QBCore = exports['qb-core']:GetCoreObject()

maxTaserCarts = 3 -- The amount of taser cartridges a person can have.

local taserCartsLeft = maxTaserCarts

RegisterNetEvent("FillTazer")
AddEventHandler("FillTazer",function(source, args, rawCommand)
    QBCore.Functions.Progressbar("load_tazer", "Reloading Tazer..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        taserCartsLeft = maxTaserCarts
        TriggerServerEvent("QBCore:Server:RemoveItem", "taserammo", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["taserammo"], "remove")
    end)
end)

local taserModel = GetHashKey("WEAPON_STUNGUN")

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()

        if GetSelectedPedWeapon(ped) == taserModel then
            if IsPedShooting(ped) then
                DisplayAmmoThisFrame(true)
                taserCartsLeft = taserCartsLeft - 1
            end
        end

        if taserCartsLeft <= 0 then
            if GetSelectedPedWeapon(ped) == taserModel then
                SetPlayerCanDoDriveBy(ped, false)
                DisablePlayerFiring(ped, true)
                if IsControlPressed(0, 106) then
                end
            end
        end

        if longerTazeTime then
            SetPedMinGroundTimeForStungun(ped, longerTazeSecTime * 1000)
        end
    end
end)

RegisterCommand('test', function()
    TriggerEvent("FillTazer")
end)