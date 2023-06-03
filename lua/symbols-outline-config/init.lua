require("symbols-outline").setup({
  highlight_hovered_item = true,
  position = "right",
  relative_width = false,
  width = 30,
  auto_close = true,
  show_symbol_details = false,
  autofold_depth = 2,
  keymaps = {
    hover_symbol = "K",
    toggle_preview = "<F24>",
    fold = {"S", "h"},
  },
})
