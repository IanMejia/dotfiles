local iron = require("iron.core")
local view = require("iron.view")
local common = require("iron.fts.common")

iron.setup {
  config = {
    repl_open_cmd = view.split(20),
    should_map_plug = false,
    scratch_repl = true,
    repl_definition = {
      python = {
        command = { "ipython", "--no-autoindent", "--profile=ian" },
        format = common.bracketed_paste_python,
        block_deviders = { "# %%", "#%%" },
      },
      sh = {
        command = { "zsh" }
      }
    }
  },
  keymaps = {
    toggle_repl = "<space>rr",
    restart_repl = "<space>rR",
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
