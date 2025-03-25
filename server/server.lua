local slowDownBoy = {}

RegisterServerEvent('forcng:sampleMeal')
AddEventHandler('forcng:sampleMeal', function()
    local src = source
    local TIME = os.time()

    if slowDownBoy[src] and TIME - slowDownBoy[src] < 300 then 
        local TIME_LEFT = 300 - (TIME - slowDownBoy[src])
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Slow Down!",
            position = 'center-right',
            description = "You are currently on cooldown. You have " .. TIME_LEFT .. " seconds left.",
            type = "error",
            icon = "fa-solid fa-hand",
        })
        return
    end    

    slowDownBoy[src] = TIME

    exports.ox_inventory:AddItem(src, 'water', 1)
    exports.ox_inventory:AddItem(src, 'burger', 1)

    TriggerClientEvent('ox_lib:notify', src, {
        title = "Free Sample Meal",
        description = "Successfully grabbed your free items",
        position = 'center-right',
        type = "success"
    })
end)
