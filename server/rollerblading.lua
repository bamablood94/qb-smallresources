local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateUseableItem("rollerblades", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		TriggerClientEvent("rollerskating:client:putOnBlades", src)
    end
end)