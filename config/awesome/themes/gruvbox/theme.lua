local themes_path = require("gears.filesystem").get_configuration_dir() .. "/themes/"
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}

theme.colors = {
    background     = "#1d2021",
    background2    = "#32302f",
    linebackground = "#282828",
    foreground     = "#ebdbb2",

    --Black + DarkGrey
    color0  = "#1D2021",
    color8  = "#928374",

    --DarkRed + Red
    color1  = "#CC241D",
    color9  = "#FB4934",

    --DarkGreen + Green
    color2  = "#98971A",
    color10 = "#B8BB26",

    --DarkYellow + Yellow
    color3  = "#D79921",
    color11 = "#FABD2F",

    --DarkBlue + Blue
    color4  = "#458588",
    color12 = "#83A598",

    --DarkMagenta + Magenta
    color5  = "#B16286",
    color13 = "#D3869B",

    --DarkCyan + Cyan
    color6  = "#689D6A",
    color14 = "#8EC07C",

    --LightGrey + White
    color7  = "#A89984",
    color15 = "#EBDBB2",
}

theme.wallpaper = themes_path .. "gruvbox/space.jpg"
-- }}}

-- {{{ Styles
theme.font      = "Fira Code Medium 8"

-- {{{ Colors
theme.fg_normal  = theme.colors.color8
theme.fg_focus   = theme.colors.color15
theme.fg_urgent  = theme.colors.color13
theme.bg_normal  = theme.colors.background
theme.bg_focus   = "#1E2320"
theme.bg_urgent  = theme.colors.background
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(1)
theme.border_width  = dpi(0)
theme.border_normal = theme.colors.background
theme.border_focus  = theme.colors.color15
theme.border_marked = theme.colors.color13

theme.gap_single_client = false
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = theme.colors.background
theme.titlebar_bg_normal = theme.colors.background
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
theme.tasklist_disable_icon = true
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = theme.colors.color13
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
theme.menu_bg_focus = theme.colors.linebackground
theme.menu_bg_normal = theme.colors.background2
theme.menu_fg_focus = theme.colors.foreground
theme.menu_fg_normal = theme.colors.foreground
-- }}}

-- {{{ Hotkeys
theme.hotkeys_font = theme.font
theme.hotkeys_border_width = dpi(1)
-- }}}

-- {{{ Notifications
theme.notification_font = theme.font
theme.notification_max_width = dpi(400)
theme.notification_icon_size = dpi(64)
theme.notification_border_width = dpi(1)
theme.notification_border_color = theme.colors.color7
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themes_path .. "gruvbox/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "gruvbox/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = themes_path .. "gruvbox/awesome-icon.png"
theme.menu_submenu_icon      = themes_path .. "gruvbox/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_path .. "gruvbox/layouts/tile.png"
theme.layout_tileleft   = themes_path .. "gruvbox/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "gruvbox/layouts/tilebottom.png"
theme.layout_tiletop    = themes_path .. "gruvbox/layouts/tiletop.png"
theme.layout_fairv      = themes_path .. "gruvbox/layouts/fairv.png"
theme.layout_fairh      = themes_path .. "gruvbox/layouts/fairh.png"
theme.layout_spiral     = themes_path .. "gruvbox/layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "gruvbox/layouts/dwindle.png"
theme.layout_max        = themes_path .. "gruvbox/layouts/max.png"
theme.layout_fullscreen = themes_path .. "gruvbox/layouts/fullscreen.png"
theme.layout_magnifier  = themes_path .. "gruvbox/layouts/magnifier.png"
theme.layout_floating   = themes_path .. "gruvbox/layouts/floating.png"
theme.layout_cornernw   = themes_path .. "gruvbox/layouts/cornernw.png"
theme.layout_cornerne   = themes_path .. "gruvbox/layouts/cornerne.png"
theme.layout_cornersw   = themes_path .. "gruvbox/layouts/cornersw.png"
theme.layout_cornerse   = themes_path .. "gruvbox/layouts/cornerse.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themes_path .. "gruvbox/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "gruvbox/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "gruvbox/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "gruvbox/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = themes_path .. "gruvbox/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "gruvbox/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "gruvbox/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "gruvbox/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_path .. "gruvbox/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "gruvbox/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "gruvbox/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "gruvbox/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themes_path .. "gruvbox/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "gruvbox/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "gruvbox/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "gruvbox/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_path .. "gruvbox/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "gruvbox/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "gruvbox/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "gruvbox/titlebar/maximized_normal_inactive.png"
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
