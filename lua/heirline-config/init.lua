local heirline_ok, heirline = pcall(require, "heirline")
if not heirline_ok then
	return
end

local utils = require("heirline.utils")
require("heirline-config.colors")
local conditions = require("heirline.conditions")

local ViMode = require("heirline-config.mode")
local Location = require("heirline-config.ruler")
local FileName = require("heirline-config.file")
local Diagnostics = require("heirline-config.diagnostics")
local LspActive = require("heirline-config.lsp")
local GitStatus = require("heirline-config.git-status")

local Align = { provider = "%=" }
local Space = { provider = " " }

local StatusLine = {
	{
		{
			{ ViMode },
			-- { Diagnostics },
			{ GitStatus },
		},
		{ Align, hl = { bg = "#000000" } },
		{ { LspActive }, { Location.Ruler, Location.ScrollBar, Space, hl = { fg = "#1affff", bg = "#000000" } } },
	},
}

local WinBar = {
	{
		{
			condition = function()
        if vim.bo.buftype ~= 'nofile' then
          return not conditions.is_active()
        end
			end,
			utils.surround({ " ", " " }, "#000000", { hl = { fg = "#1AF0F1", force = true }, FileName }),
		},
		{
			condition = function()
        if vim.bo.buftype ~= 'nofile' then
          return conditions.is_active()
        end
			end,
			utils.surround({ "", "" }, "#00363C", { hl = { fg = "#1AF0F1", force = true }, FileName }),
			hl = { bg = "#011826" },
		},
	},
}

heirline.setup({
	statusline = StatusLine,
	-- winbar = WinBar,
	opts = {
		disable_winbar_cb = function(args)
			return conditions.buffer_matches({
				buftype = { "nofile", "prompt", "help", "quickfix", "terminal" },
				filetype = { "^git.*", "fugitive", "Trouble", "dashboard", "toggleterm", "harpoon" },
			}, args.buf)
		end,
	},
})
