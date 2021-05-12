local awesome = _G.awesome

local awful = require("awful")
local beautiful = require("beautiful")
local global = require("modules.global")

local menu = {}

local launcher_power = {
   { "Shutdown", "poweroff"},
   { "Reboot",   "reboot" },
}

local launcher_awesome = {
   { "Edit config", global.editor_cmd .. " " .. awesome.conffile },
   { "Restart",     awesome.restart },
   { "Quit",        function() awesome.quit() end},
}

menu.main = awful.menu({
    items = {
        { "Awesome",  launcher_awesome, beautiful.awesome_icon },
        { "Power",    launcher_power,   beautiful.awesome_icon },
        { "Terminal", global.terminal },
    }
})

return menu
