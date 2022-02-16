Citizen.CreateThread(function()
	while true do
        Citizen.Wait(50)
        local player = GetPlayerPed(-1)
        if IsPedModel(player, 'a_c_shepherd') then
            StatSetInt(GetHashKey("MP0_STAMINA"), 40, false)
        else
            StatSetInt(GetHashKey("MP0_STAMINA"), 0, false)
        end
    end
end)