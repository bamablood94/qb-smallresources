---------------
-- Variables --
---------------
local QBCore = exports['qb-core']:GetCoreObject()

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


local MeterObjects = {
    -1940238623,
    2108567945,
}

local requiredItemsShowed = false
local requiredItems = {}

local timer = 0
local canRob = true

MaleNoHandshoes = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [18] = true,
    [26] = true,
    [52] = true,
    [53] = true,
    [54] = true,
    [55] = true,
    [56] = true,
    [57] = true,
    [58] = true,
    [59] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [112] = true,
    [113] = true,
    [114] = true,
    [118] = true,
    [125] = true,
    [132] = true,
}

FemaleNoHandshoes = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [19] = true,
    [59] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [63] = true,
    [64] = true,
    [65] = true,
    [66] = true,
    [67] = true,
    [68] = true,
    [69] = true,
    [70] = true,
    [71] = true,
    [129] = true,
    [130] = true,
    [131] = true,
    [135] = true,
    [142] = true,
    [149] = true,
    [153] = true,
    [157] = true,
    [161] = true,
    [165] = true,
}

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


function IsNearParkingMeter()
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)
    for k, v in pairs(MeterObjects) do
      local closestObj = GetClosestObjectOfType(plyCoords.x, plyCoords.y, plyCoords.z, 3.0, v, false, 0, 0)
      local objCoords = GetEntityCoords(closestObj)
      if closestObj ~= 0 then
        local dist = GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, objCoords.x, objCoords.y, objCoords.z, true)
        if dist <= 1.5 then
          return true
        end
      end
    end
    return false
end


function IsInVehicle()
    local ply = GetPlayerPed(-1)
    if IsPedSittingInAnyVehicle(ply) then
      return true
    else
      return false
    end
  end


function lockpickDone(success)

    local pos = GetEntityCoords(GetPlayerPed(-1))
    if math.random(1, 100) <= 80 and not IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end

    if success then
        TriggerServerEvent('qb-parkingmetercall', exports['cd_dispatch']:GetPlayerInfo())
        TriggerServerEvent('qb-robparking:server:sp1d3r1987')
        canRob = false
        timer = 120
    else
        if math.random(1, 100) <= 40 and IsWearingHandshoes() then
            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
            --QBCore.Functions.Notify("You ripped your gloves..")
            exports['okokNotify']:Alert('Damaged Gloves', 'You ripped your gloves.. Might want to get some new ones.', 2000, 'info')
        end
        if math.random(1, 100) <= 45 then
            TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)
            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["lockpick"], "remove")
        end
    end
end



function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(GetPlayerPed(-1), 3)
    local model = GetEntityModel(GetPlayerPed(-1))
    local retval = true
    if model == GetHashKey("mp_m_freemode_01") then
        if MaleNoHandshoes[armIndex] ~= nil and MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if FemaleNoHandshoes[armIndex] ~= nil and FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

RegisterNetEvent('qb-robparking:client:robParking', function()
    if (IsInVehicle()) then
        --QBCore.Functions.Notify('You cannot rob a parking meter in a vehicle!', 'error')
        exports['okokNotify']:Alert('Can\'t do that.', 'You cannot rob a parking meter in a vehicle!', 1500, 'warning')
    else
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)

            if result == true then
                if canRob == true then
                    QBCore.Functions.Progressbar("breaking_meter", "Breaking into parking meter..", 10000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "veh@break_in@0h@p_m_one@",
                        anim = "low_force_entry_ds",
                        flags = 16,
                    }, {}, {}, function() -- Done
                    TriggerServerEvent('qb-hud:Server:GainStress', 1)
                    TriggerEvent("qb-lockpick:client:openLockpick", lockpickDone)
                    end, function()
                        --QBCore.Functions.Notify("Failed!", "error")
                        exports['okokNotify']:Alert('Failed', 'Action Failed', 1500, 'error')
                    end)

                else
                    --QBCore.Functions.Notify('You are robbing a parking meter too soon, you have to wait '..timer..' seconds', 'error')
                    exports['okokNotify']:Alert('Gotta Wait', 'You are robbing a parking meter too soon, you have to wait '..timer..' seconds', 2500, 'warning')
                end
            else
                --QBCore.Functions.Notify('You do not have the necessary tools!', 'error')
                exports['okokNotify']:Alert('Missing Item', 'You do not have the necessary tools!', 1500, 'warning')
            end
        end, "lockpick")
    end
end)

Citizen.CreateThread(function()
    while true do
        if canRob == false then
            if timer < 0 then
                timer = 0
                canRob = true
            else
                if timer == 0 then
                    canRob = true
                else
                    timer = timer - 60
                end
            end
        end
        Citizen.Wait(60000)
    end
end)

