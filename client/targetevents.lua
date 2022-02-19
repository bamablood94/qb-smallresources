QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('vendingDrink:buy', function()
    local ShopItems = {}
    ShopItems.label = "Vending Machine"
    ShopItems.items = Config.itemDrink
    ShopItems.slots = #Config.itemDrink
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_", ShopItems)
end)

RegisterNetEvent('vendingSnack:buy', function()
    local snackItems = {}
    snackItems.label = "Vending Machine"
    snackItems.items = Config.itemSnack
    snackItems.slots = #Config.itemSnack
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_", snackItems)
end)

RegisterNetEvent('vendingCoffee:buy', function()
    local coffeeItems = {}
    coffeeItems.label = "Coffee Machine"
    coffeeItems.items = Config.itemCoffee
    coffeeItems.slots = #Config.itemCoffee
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_", coffeeItems)
end)

RegisterNetEvent('construction:buy', function()
    local constructionItems = {}
    constructionItems.label = "Construction Shop"
    constructionItems.items = Config.itemConstruction
    constructionItems.slots = #Config.itemConstruction
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Constructionshop_", constructionItems)
end)
