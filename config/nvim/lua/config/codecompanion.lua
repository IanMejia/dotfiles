local cc = require 'codecompanion'


cc.setup(
-- {
-- strategies = {
--   chat = { adapter = "phind" },
--   inline = { adapter = "phind" }
-- },
-- opts = { log_level = "DEBUG", provider = 'telescope', contains_code = true },
-- adapters = {
--   opts = {
--     show_defaults = false,
--   },
--   phind = function()
--     return require("codecompanion.adapters").extend("ollama", {
--       name = "phind", -- Give this adapter a different name to differentiate it from the default ollama adapter
--       schema = {
--         model = {
--           default = "phind-codellama:latest",
--         },
--         num_ctx = {
--           default = 16384,
--         },
--         num_predict = {
--           default = -1,
--         },
--       },
--     })
--   end,
-- },
-- }
)
