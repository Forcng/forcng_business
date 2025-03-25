function OPEN(name, menu, category)
    local menus = {}

    for _, item in pairs(menu) do
        table.insert(menus, {
            title = item.title,
            description = item.description,
            icon = 'fa-solid fa-circle-info',
            disabled = true
        })
    end

    table.insert(menus, {
        title = "Sample Meal",
        description = "Grab a free water and sample burger",
        icon = 'fa-solid fa-bottle-water',
        onSelect = function()
            TriggerServerEvent('forcng:sampleMeal')
        end
    })

    table.insert(menus, {
        title = "Close",
        icon = 'fa-solid fa-xmark',
        onSelect = function()
            lib.hideContext()
        end
    })

    lib.registerContext({
        id = 'SHOP_MENUS' .. name,
        title = "" .. category .. ": " .. name .. " Menu",
        options = menus
    })

    lib.showContext('SHOP_MENUS' .. name)
end