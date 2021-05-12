-- Commonly used values

local global = {
    modkey          = "Mod4",
    altmod          = "Mod1",
    terminal        = "st",
    editor          = os.getenv("EDITOR") or "nvim",
    explorer        = "thunar",
    browser         = "firefox",
    -- panel_size      = dpi(50),
    -- panel_position  = "left",
}

global.editor_cmd   = global.terminal .. " -e " .. global.editor
global.explorer_cmd = global.terminal .. " -e " .. global.explorer


return global
