CreateThread(function()
	while true do
		Wait(0)
		if IsPedArmed(PlayerPedId(), 2) or IsPedArmed(PlayerPedId(), 4) then
			SetPlayerLockonRangeOverride(PlayerId(), 0.0)
		end
	end
end)