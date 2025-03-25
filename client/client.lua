local BUSINESS_PEDS = {}

Citizen.CreateThread(function()
    for _, business in pairs(CONFIG.SHOPS) do

        RequestModel(business.ped)

        while not HasModelLoaded(business.ped) do
            Wait(0)
        end

        local ped = CreatePed(0, business.ped, business.coords.x, business.coords.y, business.coords.z - 1, business.coords.w, false, false)

        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)

        table.insert(BUSINESS_PEDS, ped)

        exports.ox_target:addLocalEntity(ped, {
            {
                label = 'Open ' .. business.name .. ' Menu',
                icon = 'fa-solid fa-store',
                distance = 2.5,
                onSelect = function()
                    OPEN(business.name, business.menu, business.category)
                end
            }
        })
    end
end)
