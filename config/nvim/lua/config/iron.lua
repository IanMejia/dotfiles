local iron = require("iron.core")
local view = require("iron.view")

iron.setup {
  config = {
    repl_open_cmd = view.bottom(30),
    should_map_plug = false,
    scratch_repl = true,
    repl_definition = {
      sh = {
        command = { "zsh" }
      }
    }
  },
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
}
