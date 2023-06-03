local navbuddy = require("nvim-navbuddy")
local actions = require("nvim-navbuddy.actions")

navbuddy.setup {
  window = {
    -- border = "none"
    border = "single"
  },
  lsp = {
    auto_attach = true,
  },
  mappings = {
    [";"] = actions.close(),
  },
  source_buffer = {
    follow_node = false,
    highlight = false,
  }
}
