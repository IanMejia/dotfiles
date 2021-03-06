local awful = require("awful")
local beautiful = require("beautiful")

local bindings = require("modules.keybindings")

local rules = {
    { rule = { },
      properties =
      { border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        size_hints_honor = false,
        keys = bindings.keyboard.client,
        buttons = bindings.mouse.client,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen
      }
    },

    -- floating clients
    { rule_any = {
        instance = {
          "calibre",
        },
        class = {
          "calibre-ebookb-viewer",
          "Arandr",
          "Pavucontrol",
          "Lxappearance",
          "transmission",
          "Sxiv",
          "Zathura",
          "feh",
          "Thunar",
          "Makie",
        },
        role = {
          "nvim",
        },
      },
      properties = { floating = true }
    },

    -- fullscreen clients
    { rule_any = {
        class = {
            "Stremio",
        },
      },
      properties = { fullscreen = true }
    },

    -- tag 2
    { rule_any = {
        class = {
          "firefox",
        },
      },
      properties = {
        screen = 1,
        tag = "web",
      }
    },

    -- tag 3
    { rule_any = {
        class = {
          "calibre-ebookb-viewer",
          "calibre",
          "Stremio",
          "discord",
          "freezer",
          "calibre",
        },
      },
      properties = {
        screen = 1,
        tag = "docs",
      }
    },

    -- tag 4
    { rule_any = {
        class = {
          "Inkscape",
          "Gimp",
        },
      },
      properties = {
        screen = 1,
        tag = "img",
      }
    },

    -- tag 5
    { rule_any = {
        class = {
            "Thunar",
        },
      },
      properties = {
        screen = 1,
        tag = "fm",
      }
    },

    -- tag 6
    { rule_any = {
        class = {
          "Lxappearance",
          "Pavucontrol"
        },
      },
      properties = {
        screen = 1,
        tag = "conf",
      }
    },
}

return rules
