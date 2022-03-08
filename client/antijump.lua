Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if IsPedOnFoot(PlayerPedId()) and not IsPedSwimming(PlayerPedId()) and (IsPedRunning(PlayerPedId()) or IsPedSprinting(PlayerPedId())) and not IsPedClimbing(PlayerPedId()) and IsPedJumping(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) then
            local Result = math.random()
            if Result < Config.RagdollChance then 
                Citizen.Wait(600)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
                SetPedToRagdoll(PlayerPedId(), 5000, 1, 2)
            else
                Citizen.Wait(2000)
            end
        end
    end
end)