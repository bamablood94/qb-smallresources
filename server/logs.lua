local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = '',
    ['testwebhook'] = '',
    ['playermoney'] = '',
    ['playerinventory'] = '',
    ['robbing'] = '',
    ['cuffing'] = '',
    ['drop'] = '',
    ['trunk'] = '',
    ['stash'] = '',
    ['glovebox'] = '',
    ['banking'] = '',
    ['vehicleshop'] = '',
    ['vehicleupgrades'] = '',
    ['shops'] = '',
    ['dealers'] = '',
    ['storerobbery'] = '',
    ['bankrobbery'] = '',
    ['powerplants'] = '',
    ['death'] = '',
    ['join'] = 'https://discord.com/api/webhooks/972291018357604392/yaWmEnZQlAaKkvarx3Adw12FmlDzmQnKcUVo0f0Glq_911L2zr-Tj3sWgdRdxFDQTmUa',
    ['leave'] = 'https://discord.com/api/webhooks/972291018357604392/yaWmEnZQlAaKkvarx3Adw12FmlDzmQnKcUVo0f0Glq_911L2zr-Tj3sWgdRdxFDQTmUa',
    ['deletedchar.'] = '',
    ['ooc'] = '',
    ['report'] = '',
    ['me'] = '',
    ['pmelding'] = '',
    ['112'] = '',
    ['bans'] = '',
    ['anticheat'] = '',
    ['weather'] = '',
    ['moneysafes'] = '',
    ['bennys'] = '',
    ['bossmenu'] = 'https://discord.com/api/webhooks/980657630328541235/PgeBDnqvmcRcizxc60eqPHj_vkcjaR96G0RscJ7BwyYjbJqfG0jWu8IiYU-On3RyYvk9',
    ['robbery'] = '',
    ['casino'] = '',
    ['traphouse'] = '',
    ['911'] = '',
    ['palert'] = '',
    ['house'] = '',
    ['twitter'] = 'https://discord.com/api/webhooks/941910013025329182/XhX0-vhBNHvkQmkSG4GBkSMPmYD_qzkwsejUVoIJMP4IfDqXQnTzH_kcZYKHoqSopXwh',
    ['advert'] = 'https://discord.com/api/webhooks/978840754598338570/rsd1XA4dMAE33I_KB8NdGqsywwuhzp4X8SOy0v-nyHaA2jMqoKNJ2Ofol37aIKqQDWWU',
    ['discordia'] = 'https://discord.com/api/webhooks/979084407472259103/8cUDZQDxEoiopqQOOtxFW2K_n9uOIjJ-oYlSnKdzY2De3kOZEIr5ie5_tEfP22IrTZ2h',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
    ['twitterblue'] = 2061822
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local url = urls or nil
        username = 'QB Logs'
        botname = 'QB Logs'
        avatar = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670'
        icon = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670'
    if name == 'twitter' then
        username = 'Twitter'
        botname = ''
        avatar = 'https://i.pinimg.com/736x/ee/af/9c/eeaf9ce3ab22ecb3904daea1b2eab04a.jpg'
    elseif name == 'discordia' then
        username = 'discordia'
        botname = ''
        avatar = 'https://i.pinimg.com/originals/0d/8b/43/0d8b437a4c1c788f036590bc4b71ff55.png'
    elseif name == 'advert' then
        username = 'Advert'
        botname = ''
        avatar = 'https://cdn.icon-icons.com/icons2/1527/PNG/512/newspaper_106688.png'
    elseif name == 'join' then
        username = 'Flew In'
        botname = ''
        avatar = 'https://www.pngitem.com/pimgs/m/56-568107_right-arrow-icon-green-right-arrow-transparent-background.png'
    elseif name == 'leave' then
        username = 'Flew Out'
        botname = ''
        avatar = 'https://cdn0.iconfinder.com/data/icons/social-messaging-ui-color-shapes-3/3/21-512.png'
    end
        local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = botname,
                ['icon_url'] = icon,
            },
            ['image'] = {
                ['url'] = url
            }
        }
    }
    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = username, avatar_url = avatar, embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = username, content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
