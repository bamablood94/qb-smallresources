local objects = {
    {x = 266.09, y = -349.35, z = 44.74, model = "prop_sec_barier_02b"}, 
    {x = 285.28, y = -355.78, z = 45.13, model = "prop_sec_barier_02a"}, 
    {x = 207.48, y = -804.27, z = 30.97, model = 'prop_sec_barrier_ld_01a'},
    {x = 207.48, y = -804.27, z = 30.97, model = 'prop_sec_barier_base_01'},
    {x = 231.03, y = -815.70, z = 30.35, model = 'prop_sec_barrier_ld_01a'},
    {x = 231.03, y = -815.70, z = 30.35, model = 'prop_sec_barier_base_01'},
    {x = 799.64, y = -3150.51, z = 5.71, model = 'prop_sec_barrier_ld_02a'},
    {x = 799.64, y = -3150.51, z = 5.71, model = 'prop_sec_barier_base_01'},
    {x = 797.07, y = -3153.13, z = 5.89, model = 'prop_sec_barrier_ld_02a'},
    {x = 797.07, y = -3153.13, z = 5.89, model = 'prop_sec_barier_base_01'},
    {x = 792.78, y = -3157.21, z = 5.89, model = 'prop_sec_barrier_ld_02a'},
    {x = 792.78, y = -3157.21, z = 5.89, model = 'prop_sec_barier_base_01'},
    {x = 788.04, y = -3161.34, z = 5.89, model = 'prop_sec_barrier_ld_02a'},
    {x = 788.04, y = -3161.34, z = 5.89, model = 'prop_sec_barier_base_01'},
    {x = 1204.84, y = -3110.69, z = 5.55, model = 'prop_com_gar_door_01'}
}

CreateThread(function()
    while true do
        for k, v in pairs(objects) do
            local ent = GetClosestObjectOfType(objects[k].x, objects[k].y, objects[k].z, 2.0, GetHashKey(objects[k].model), false, false, false)

            SetEntityAsMissionEntity(ent, 1, 1)
            DeleteObject(ent)
            SetEntityAsNoLongerNeeded(ent)
        end

        Wait(5000)
    end
end)
