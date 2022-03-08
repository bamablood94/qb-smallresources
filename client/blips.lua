local blips = {
    {name = 'Construction Job', id = 648, x=-509.28,y=-1001.28,z=23.55, color = 5},
    {name = 'Hunting Shop', id = 458, x = 2030.92, y = 4980.13, z = 42.1, color = 0},
    {name = 'Hunting Zone', id = 141, x = -959.2, y = 4698.16, z = 268.16, color = 0},
    --[[{name="Art Gallery", id=362, x = 15.159727, y = 144.60311, z = 93.791381, color = 27},
    {name="Auction House", id=76, x = -1098.75, y = -1270.72, z = 5.84, color = 29},

    {name="Legal Crafting", id=566, x = 754.37, y = -3195.17, z = 6.07, color = 5},

    {name="VIP Market", id=674, x = -1096.34, y = -324.36, z = 37.82, color = 27},

    {name="Premium Deluxe Motorsports", id=523, x = -45.67, y = -1098.34, z = 26.42, color = 47},
    {name="Truck Shop", id=616, x = 846.94, y = -2342.85, z = 30.56, color = 47},
    {name="Aircraft Shop", id=584, x = -1271.51, y = -3380.56, z = 13.93, color = 47},
    {name="Watercraft Shop", id=455, x = -832.44, y = -1412.11, z = 1.61, color = 38},

    {name="Real Estate", id=375, x = -704.49, y = 268.01, z = 83.15, color = 38},

    {name="Diamond Casino", id=680, x = 924.32, y = 47.13, z = 81.11, color = 0},

    {name="Fire Station", id=436, x = 212.73, y = -1642.5, z = 29.79, color = 6},
    {name="Fire Station", id=436, x = -378.06, y = 6119.31, z = 31.44, color = 6},

    {name="Fishing Shop", id=410, x = -860.7, y = -1347.38, z = 0.12, color = 74},
    {name="Fishing Shop", id=410, x = -1599.932, y = 5259.831, z = 1.578, color = 74},
    {name="Pearls Seafood", id=68, x = -1816.406, y = -1193.334, z = 13.305, color = 74},
    {name="Fishing Spot", id=317, x = -3154.35, y = 4146.76, z = 0.0, color = 3},

    -- {name="Capture Point [Weed]", id=652, x = 1920.22, y = 588.8, z = 176.37, color = 52},
    -- {name="Capture Point [Meth]", id=652, x = 40.94, y = 3658.51, z = 39.73, color = 46},
    -- {name="Capture Point [Cocaine]", id=652, x = -2166.94, y = 5197.13, z = 16.88, color = 6},

    {name="Player Market", id=685, x = -379.46, y = 275.92, z = 84.78, color = 7},

    {name="Jimmy's Tuning Shop", id=641, x = 1876.17, y = 3759.51, z = 32.96, color = 19},

    {name="Bobs 10 Pin Bowling", id=511, x = 754.86, y = -774.98, z = 26.34, color = 2},

    {name="Vin Scratching/Boosting", id=524, x = 915.61, y = 3560.64, z = 33.8, color = 1},

    {name="Chop Shop", id=651, x = 2488.83, y = 3444.15, z = 50.18, color = 1},

    {name="Art Gallery", id=362, x = 13.51, y = 148.39, z = 93.79, color = 35},

    {name="LS Trucking Companies Hub", id=477, x = 1208.76, y = -3114.77, z = 5.56, color = 47},

    {name="Farming Supplies", id=478, x = 2529.51, y = 4984.7, z = 44.79, color = 2},
    {name="Farming Packaging", id=514, x = 421.53, y = 6474.05, z = 28.81, color = 2},]]
}


CreateThread(function()

    for _, item in pairs(blips) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipScale(item.blip,0.7)
      SetBlipAsShortRange(item.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
      SetBlipColour(item.blip, item.color)
    end

    Wait(4000)
end)

local state = true
RegisterCommand('toggleblips',function()
  state = not state
    for _, item in pairs(blips) do
      if state then
        item.blip = AddBlipForCoord(item.x, item.y, item.z)
        SetBlipSprite(item.blip, item.id)
        SetBlipDisplay(item.blip, 4)
        SetBlipScale(item.blip, 0.5)
        SetBlipColour(item.blip, item.colour)
        SetBlipAsShortRange(item.blip, false)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(item.title)
        EndTextCommandSetBlipName(item.blip)
      else
        RemoveBlip(item.blip)
    end
  end
end)
