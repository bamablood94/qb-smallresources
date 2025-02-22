local crosshairParameters =
{
	["width"] =
	{
		["label"] = "Width",
		["allValues"] = {0.002, 0.0025, 0.003, 0.0035, 0.004, 0.0045, 0.005, 0.0055, 0.006, 0.0065, 0.007, 0.0075, 0.008, 0.0085, 0.009, 0.0095, 0.010,
		0.0105, 0.011, 0.0115, 0.012, 0.0125, 0.013, 0.0135, 0.014, 0.0145, 0.015, 0.0155, 0.016, 0.0165, 0.017, 0.0175, 0.018, 0.0185, 0.019, 0.0195, 0.02},
		["currentValue"] = 3,
	},
	["gap"] =
	{
		["label"] = "Gap",
		["allValues"] = {0.0, 0.0005, 0.001, 0.0015, 0.002, 0.0025, 0.003, 0.0035, 0.004, 0.0045, 0.005, 0.0055, 0.006, 0.0065, 0.007, 0.0075, 0.008, 0.0085, 0.009, 0.0095, 0.01},
		["currentValue"] = 3,
	},
	["dot"] =
	{
		["label"] = "Dot",
		["allValues"] = {false, true},
		["currentValue"] = 2,
	},
	["thickness"] =
	{
		["label"] = "Thickness",
		["allValues"] = {0.002, 0.004, 0.006, 0.008, 0.01, 0.012, 0.014, 0.016, 0.018, 0.02},
		["currentValue"] = 1,
	},
	["gtacross"] =
	{
		["label"] = "Activate default GTA (1 = OFF)",
		["allValues"] = {false, true},
		["currentValue"] = 2,
	},
	["color"] =
	{
		["label"] = "Color",
		["allValues"] = {
			{R = 255,	G = 255,	B = 255},{R = 0,	G = 0,	B = 0},{R = 255,	G = 0,	B = 0},{R = 0,	G = 255,	B = 0},{R = 0,	G = 0,	B = 255},{R = 255,	G = 255,	B = 0},
			{R = 255,	G = 0,	B = 255},{R = 0,	G = 255,	B = 255},{R = 255,	G = 165,	B = 0},{R = 0,	G = 128,	B = 0},{R = 128,	G = 0,	B = 128},
		},
		["currentValue"] = 1,
	},
	["opacity"] =
	{
		["label"] = "Opacity",
		["allValues"] = {25, 50, 75, 100, 125, 150, 175, 200, 225, 255},
		["currentValue"] = 10,
	},
}

local allDefaultValues =
	{
		{param = "thickness", value = 1},
		{param = "width", value = 3},
		{param = "gap", value = 3},
		{param = "dot", value = 2},
		{param = "gtacross", value = 2},
		{param = "color", value = 1},
		{param = "opacity", value = 10},
	}

local parameters = {"width", "gap", "dot", "thickness", "gtacross", "color", "opacity"}

local currentParamIndex = 1
local isEditing = false


local function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local function GetInitialDatas()
	local customCrosshairData = GetResourceKvpInt("qb-crosshair_custom")
	if not customCrosshairData or customCrosshairData == 0 then
		customCrosshairData = 2
		SetResourceKvpInt("qb-crosshair_custom", 2)
	end

	if customCrosshairData == 1 then
		customCrosshairState = false
	else
		customCrosshairState = true
	end

	for k,v in pairs(allDefaultValues) do
		local currentData = GetResourceKvpInt("qb-crosshair_" .. v.param)
		if not currentData or currentData == 0 then
			SetResourceKvpInt("qb-crosshair_" .. v.param, v.value)
		else
			crosshairParameters[v.param]["currentValue"] = currentData
		end
	end
end

local function SaveDatas()
	for k,v in pairs(allDefaultValues) do
		SetResourceKvpInt("qb-crosshair_" .. v.param, crosshairParameters[v.param]["currentValue"])
	end

	--qbCore.Functions.Notify("Crosshair has been updated", 'success')
	exports['okokNotify']:Alert('Update', 'Crosshair has been updated!', 1500, 'success')
end

local function ResetDatas()
	local allSettings =
	{
		{param = "thickness", value = 1},
		{param = "width", value = 3},
		{param = "gap", value = 3},
		{param = "dot", value = 2},
		{param = "gtacross", value = 2},
		{param = "color", value = 1},
		{param = "opacity", value = 10},
	}

	for k,v in pairs(allSettings) do
		SetResourceKvpInt("qb-crosshair_" .. v.param, v.value)
	end

	--qbCore.Functions.Notify("Crosshair has been reset", 'error')
	exports['okokNotify']:Alert('Reset', 'Crosshair has been reset', 1500, 'error')

	GetInitialDatas()
end

Citizen.CreateThread(function()
	GetInitialDatas()

	Citizen.Wait(2000)

	while true do

		if (IsPlayerFreeAiming(PlayerId()) and GetFollowPedCamViewMode() ~= 4 and customCrosshairState) or isEditing then
			local ratio = GetAspectRatio()

			local thickness = crosshairParameters["thickness"]["allValues"][crosshairParameters["thickness"]["currentValue"]]
			local width		= crosshairParameters["width"]["allValues"][crosshairParameters["width"]["currentValue"]]
			local gap		= crosshairParameters["gap"]["allValues"][crosshairParameters["gap"]["currentValue"]]
			local dot		= crosshairParameters["dot"]["allValues"][crosshairParameters["dot"]["currentValue"]]

			local colorSelected = crosshairParameters["color"]["currentValue"]
			local colorR = crosshairParameters["color"]["allValues"][colorSelected].R
			local colorG = crosshairParameters["color"]["allValues"][colorSelected].G
			local colorB = crosshairParameters["color"]["allValues"][colorSelected].B

			local colorOpacity	= crosshairParameters["opacity"]["allValues"][crosshairParameters["opacity"]["currentValue"]]


			DrawRect(0.5 - gap - width / 2, 0.5, width, thickness, colorR, colorG, colorB, colorOpacity)
			DrawRect(0.5 + gap + width / 2, 0.5, width, thickness, colorR, colorG, colorB, colorOpacity)
			DrawRect(0.5, 0.5 - (gap*ratio) - (width*ratio) / 2, thickness / ratio, width * ratio, colorR, colorG, colorB, colorOpacity)
			DrawRect(0.5, 0.5 + (gap*ratio) + (width*ratio) / 2, thickness / ratio, width * ratio, colorR, colorG, colorB, colorOpacity)
			if dot then
				DrawRect(0.5, 0.5, (thickness/2), (thickness/2) * ratio, colorR, colorG, colorB, colorOpacity)
			end
		end

		if isEditing then
			local currentParameter = parameters[currentParamIndex]

			DisplayHelpText("~INPUT_CELLPHONE_UP~ " .. crosshairParameters[currentParameter]["label"] .. "\n~INPUT_REPLAY_ADVANCE~ " .. crosshairParameters[currentParameter]["currentValue"] .. "\n~INPUT_CONTEXT~ Save")

			if IsControlJustPressed(1, 172) then
				currentParamIndex = currentParamIndex + 1
				if currentParamIndex > #parameters then currentParamIndex = 1 end
			elseif IsControlJustPressed(1, 173) then
				currentParamIndex = currentParamIndex - 1
				if currentParamIndex < 1 then currentParamIndex = #parameters end
			elseif IsControlJustPressed(1, 307) then
				local currentValue = crosshairParameters[currentParameter]["currentValue"] + 1
				if currentValue > #crosshairParameters[currentParameter]["allValues"] then currentValue = 1 end
				crosshairParameters[currentParameter]["currentValue"] = currentValue
			elseif IsControlJustPressed(1, 308) then
				local currentValue = crosshairParameters[currentParameter]["currentValue"] - 1
				if currentValue < 1 then currentValue = #crosshairParameters[currentParameter]["allValues"] end
				crosshairParameters[currentParameter]["currentValue"] = currentValue
			elseif IsControlJustPressed(1, 51) then
				SaveDatas()
				isEditing = false
			end
		end

		Citizen.Wait(0)
	end
end)

-- Events
AddEventHandler("qb-crosshair:active", function()
	customCrosshairState = not customCrosshairState
	if customCrosshairState then
		SetResourceKvpInt("qb-crosshair_custom", 2)
	else
		SetResourceKvpInt("qb-crosshair_custom", 1)
	end
end)

AddEventHandler("qb-crosshair:edit", function()
	isEditing = true
end)

AddEventHandler("qb-crosshair:reset", function()
	ResetDatas()
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/crossedit', 'Toggle Crosshair', {})
    TriggerEvent('chat:addSuggestion', '/crossedit', 'Edit Crosshair', {})
    TriggerEvent('chat:addSuggestion', '/crossreset', 'Reset Crosshair', {})
end)

RegisterCommand('crosstoggle', function(source, args)
	TriggerEvent("qb-crosshair:active")
end)

RegisterCommand('crossedit', function(source, args)
	TriggerEvent("qb-crosshair:edit")
end)

RegisterCommand('crossreset', function(source, args)
	TriggerEvent("qb-crosshair:reset")
end)