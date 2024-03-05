Citizen.CreateThread(function()
    local Ped = {}
    local peds = 0
    while true do
        Ped = GetGamePool('CPed')
        for i,v in pairs(Config.Location) do
            for i = 1, #Ped do -- loop through each vehicle (entity)
                peds = Ped[i]
                if IsEntityAPed(peds) and peds ~= PlayerPedId() and IsPedHuman(peds) then
                    local pedcoords = GetEntityCoords(peds)
                    local coords2 = v.coords
                    local dist = GetDistanceBetweenCoords(pedcoords, coords2 )
                    if dist < v.radius then
                        DeleteEntity(peds)
                    end
                end
            end
        end
    Citizen.Wait(500)
    end
end)