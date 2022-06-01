QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = false
animalSpawned = false
companion = nil
spawnDistanceRadius = 1.0
animalName = nil
local ball, getball = false, false

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
	animalSpawned = false
    companion = nil
end)

AddEventHandler('onClientResourceStart', function ()
	animalSpawned = false
    companion = nil
end)

RegisterNetEvent('qb-companions:client:ToggleCompanion')
AddEventHandler('qb-companions:client:ToggleCompanion', function(model)
    if companion == nil or #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(companion)) < 2.0 then
        -- Make Animal Sit
        if companion ~= nil then
            if Config.Animations[animalName]["sit"].animationDict ~= "" then
                RequestAnimDict(Config.Animations[animalName]["sit"].animationDict)
                while not HasAnimDictLoaded(Config.Animations[animalName]["sit"].animationDict) do
                    Wait(1)
                end
                TaskPlayAnim(companion, Config.Animations[animalName]["sit"].animationDict, Config.Animations[animalName]["sit"].task, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
            end
        end
        TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)

        local progressBarMessage = "Picking Up Companion.."
        if not animalSpawned then
            progressBarMessage = "Placing Companion.."
        end

        QBCore.Functions.Progressbar("toggle_companion", progressBarMessage, 2000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            if not animalSpawned then
                -- spawn animal
                spawnAnimal(model)
                animalSpawned = true
            else
                --delete animal
                deleteAnimal()
                animalSpawned = false
            end
            ClearPedTasks(PlayerPedId())
        end, function() -- Cancel
            ClearPedTasks(PlayerPedId())
        end)
    else
        --QBCore.Functions.Notify("Companion is too far..", "error")
        exports['okokNotify']:Alert('Too Far Away', 'Companion is too far away..', 1500, 'warning')
    end
end)

function spawnAnimal(modelName)
    local hash = GetHashKey(modelName)

    local coords = GetEntityCoords(PlayerPedId())
    local spawnX = math.random(-spawnDistanceRadius,spawnDistanceRadius)
	local spawnY = math.random(-spawnDistanceRadius,spawnDistanceRadius)
	local spawnLoc = vector3(coords.x + spawnX, coords.y + spawnY, coords.z -1.0)

	RequestModel(modelName)
	while not HasModelLoaded(modelName) do
		Citizen.Wait(10)
	end

    animalName = modelName
	companion = CreatePed(28, hash, spawnLoc, true, true, true)
    SetModelAsNoLongerNeeded(modelName)

    -- OPEN MENU LOOP
    Citizen.CreateThread(function()
        while companion ~= nil do
            Citizen.Wait(3)
            if IsControlJustPressed(0, 74) then -- 74 FOR H
                -- open menu
                TriggerEvent('qb-menu:CompanionsMenu')
            end
        end
    end)
end

function deleteAnimal()
    DeleteEntity(companion)
    companion = nil
    animalName = nil
end

-- OPEN MENU
RegisterNetEvent('qb-menu:CompanionsMenu', function(data)
    local companionsMain = {
        {
            header = '< Companion Menu',
            txt = "ESC or click to close",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = 'Follow',
            params = {
                event = 'qb-companions:client:Follow',
            }
        },
        {
            header = 'Put In Vehicle',
            params = {
                event = 'qb-companions:client:PutInVehicle',
            }
        },
        {
            header = 'Take from vehicle',
            params = {
                event = 'qb-companions:client:TakeFromVehicle',
            }
        },
        {
            header = 'Animations',
            params = {
                event = 'qb-companions:client:Animations',
            }
        },
        {
            header = 'Pick Up',
            params = {
                event = 'qb-companions:client:PickUpCompanion',
            }
        },
    }
    exports['qb-menu']:openMenu(companionsMain)
end)



RegisterNetEvent('qb-companions:client:Follow')
AddEventHandler('qb-companions:client:Follow', function()
    if companion ~= nil then
        -- PED DO WHISTLE
        RequestAnimDict("rcmnigel1c")
        while not HasAnimDictLoaded("rcmnigel1c") do
            Wait(1)
        end
        TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a' ,8.0, -8, -1, 120, 0, false, false, false)
        -- COMPANION FOLLOW
        TaskGoToEntity(companion, PlayerPedId(), -1, 1.0, 10.0, 1073741824.0, 0)
        SetPedKeepTask(companion, true)
        --QBCore.Functions.Notify('Sometimes your pet can be a bit lazy. If they arent moving, try giving them a budge!', 'error', 4000)
        exports['okokNotify']:Alert('Companion Information', 'Sometimes your pet can be a bit lazy. If they aren\'t moving, try giving them a budge!', 4000, 'warning')
    end
end)

function getNearestVeh()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)

    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end

companionInTrunk = false
RegisterNetEvent('qb-companions:client:PutInVehicle')
AddEventHandler('qb-companions:client:PutInVehicle', function()
    if companion ~= nil then
        if not companionInTrunk then
            local ped = PlayerPedId()
            local closestVehicle = getNearestVeh()
            local companionCoords = GetEntityCoords(companion)
            if #(GetEntityCoords(PlayerPedId()) - companionCoords) < 2.5 then
                if closestVehicle ~= 0 then
                    local vehClass = GetVehicleClass(closestVehicle)
                    if GetVehicleDoorAngleRatio(closestVehicle, 5) > 0 then
                        offset = {
                            x = Config.TrunkClasses[vehClass].x,
                            y = Config.TrunkClasses[vehClass].y,
                            z = Config.TrunkClasses[vehClass].z,
                        }
                        AttachEntityToEntity(companion, closestVehicle, 0, offset.x, offset.y, offset.z, 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
                        Citizen.Wait(250)
                        SetVehicleDoorShut(closestVehicle, 5, false)
                        SetEntityVisible(companion, false, false)
                        --QBCore.Functions.Notify('You placed your companion in the vehicle.', 'success', 4000)
                        exports['okokNotify']:Alert('Companion Placed', 'You placed your companion in the vehicle', 4000, 'success')
                        companionInTrunk = true
                    else
                        --QBCore.Functions.Notify('Is the trunk closed?', 'error', 2500)
                        exports['okokNotify']:Alert('Trunk Closed', 'Is the trunk closed? Try Opening the Trunk first', 2500, 'warning')
                    end
                else
                    --QBCore.Functions.Notify('You need to do this from behind the vehicle while looking at the trunk.', 'error', 2500)
                    exports['okokNotify']:Alert('Too Far Away', 'You nned to be at the trunk to do this.', 2500, 'warning')
                end
            else
                --QBCore.Functions.Notify('Your companion is too far..', 'error', 2500)
                exports['okokNotify']:Alert('Too Far Away', 'Your companion is too far away..', 2500, 'warning')
            end
        else
            --QBCore.Functions.Notify("Your companion is already inside a vehicle..", 'error', 2500)
            exports['okokNotify']:Alert('Already In Vehicle', 'Your companion is already in a vehicle.', 2500, 'warning')
        end
    end
end)

RegisterNetEvent('qb-companions:client:TakeFromVehicle')
AddEventHandler('qb-companions:client:TakeFromVehicle', function()
    if companion ~= nil then
        if companionInTrunk then
            local vehicle = getNearestVeh()
            if vehicle ~= nil then
                -- OPEN TRUNK
                SetVehicleDoorOpen(vehicle, 5, false, true)
                Wait(500)
                local vehCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0, -5.0, 0)
                DetachEntity(companion, true, true)
                ClearPedTasks(companion)
                SetEntityCoords(companion, vehCoords.x, vehCoords.y, vehCoords.z)
                SetEntityCollision(PlayerPedId(), true, true)
                SetEntityVisible(companion, true, true)
                companionInTrunk = false
                -- SET FOLLOW
                TaskGoToEntity(companion, PlayerPedId(), -1, 1.0, 10.0, 1073741824.0, 0)
                SetPedKeepTask(companion, true)
                -- CLOSE TRUNK
                SetVehicleDoorShut(vehicle, 5, false)
            else
                --QBCore.Functions.Notify('You need to do this from behind the vehicle..', 'error', 2500)
                exports['okokNotify']:Alert('Too Far Away', 'You need to be behind the vehicle to do this.', 2500, 'warning')
            end
        else
            --QBCore.Functions.Notify("You're companion is not in a vehicle..", 'error', 2500)
            exports['okokNotify']:Alert('Not In Vehicle', 'You\'re companion is not in a vehicle', 2500, 'warning')
        end
    end
end)

RegisterNetEvent('qb-menu:client:Animations', function(data)
    local animationsMain = {
        {
            header = '< Companion Menu',
            txt = "< Go Back",
            params = {
                event = "qb-menu:CompanionsMenu",
            }
        },
        {
            header = 'Clear Animation',
            params = {
                event = 'qb-companions:client:ClearAnimation',
            }
        },
        {
            header = 'Lay down',
            params = {
                event = 'qb-companions:client:Animation',
                args = {
                    animation = "lay"
                }
            }
        },
        {
            header = 'Trick',
            params = {
                event = 'qb-companions:client:Animation',
                args = {
                    animation = "trick"
                }
            }
        },
        {
            header = 'Sit',
            params = {
                event = 'qb-companions:client:Animation',
                args = {
                    animation = "sit"
                }
            }
        },
        {
            header = 'Intimidate',
            params = {
                event = 'qb-companions:client:Animation',
                args = {
                    animation = "intimidate"
                }
            }
        },
    }
    exports['qb-menu']:openMenu(animationsMain)
end)

RegisterNetEvent('qb-companions:client:ClearAnimation', function()
    if companion ~= nil then
        ClearPedTasks(companion)
    end
end)

RegisterNetEvent('qb-companions:client:Animation', function(data)
    if companion ~= nil then
        if not companionInTrunk then
            local animation = data.animation
            local animDict = Config.Animations[animalName][animation].animationDict
            local animTask = Config.Animations[animalName][animation].task

            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do
                Wait(1)
            end

            Wait(500)
            TaskPlayAnim(companion, animDict, animTask, 8.0, 0.0, -1, 0, 0, 0, 0, 0)
            if Config.Animations[animalName][animation].taskWait ~= nil then
                Wait(Config.Animations[animalName][animation].taskWait)
                TaskPlayAnim(companion, animDict, Config.Animations[animalName][animation].taskExit, 8.0, 0.0, -1, 0, 0, 0, 0, 0)
            end
            SetPedKeepTask(companion, false)
            -- RE OPEN MENU
            TriggerEvent('qb-companions:client:menu:Animations')
        else
            --QBCore.Functions.Notify("Cannnot do this inside a vehicle..", 'error', 2500)
            exports['okokNotify']:Alert('Can\'t Do This', 'Can\'t do this inside a vehicle.', 2500, 'warning')
        end
    end
end)

RegisterNetEvent('qb-companions:client:PickUpCompanion', function(data)
    if companion ~= nil then
        TriggerEvent('qb-companions:client:ToggleCompanion', animalName)
    end
end)

--[[RegisterNetEvent('qb-companions:client:fetchBall', function()
    local pedCoords = GetEntityCoords(companion)
    local object = GetClosestObjectOfType(pedCoords, 190.0, GetHashKey('w_am_baseball'))

    if DoesEntityExist(object) then
        ball = true
        objCoords = GetEntityCoords(object)
        TaskGoToCoordAnyMeans(companion, objCoords, 5.0, 0, 0, 786603, 0xbf800000)
        local GroupHandle = GetPlayerGroup(PlayerId())
        SetGroupSeparationRange(GroupHandle, 1.9)
        SetPedNeverLeavesGroup(companion, false)
    else
        QBCore.Functions.Notify('Your dog cannot find a ball!')
    end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(30)

		if ball then
			local coords1 = GetEntityCoords(PlayerPedId())
			local coords2 = GetEntityCoords(companion)
			local distance  = GetDistanceBetweenCoords(objCoords, coords2, true)
			local distance2 = GetDistanceBetweenCoords(coords1, coords2, true)

			if distance < 0.5 then
				local boneIndex = GetPedBoneIndex(companion, 17188)
				AttachEntityToEntity(object, companion, boneIndex, 0.120, 0.010, 0.010, 5.0, 150.0, 0.0, true, true, false, true, 1, true)
				TaskGoToCoordAnyMeans(companion, coords1, 5.0, 0, 0, 786603, 0xbf800000)
				ball = false
				getball = true
			end
		end

		if getball then
			local coords1 = GetEntityCoords(PlayerPedId())
			local coords2 = GetEntityCoords(companion)
			local distance2 = GetDistanceBetweenCoords(coords1, coords2, true)

			if distance2 < 1.5 then
				DetachEntity(object,false,false)
				Citizen.Wait(50)
				SetEntityAsMissionEntity(object)
				DeleteEntity(object)
				TriggerServerEvent('QBCore:Server:AddItem', 'weapon_ball', 1)
				local GroupHandle = GetPlayerGroup(PlayerId())
				SetGroupSeparationRange(GroupHandle, 999999.9)
				SetPedNeverLeavesGroup(companion, true)
				SetPedAsGroupMember(companion, GroupHandle)
				getball = false
			end
		end
	end
end)]]