local api = vim.api

-- vim.api.nvim_create_augroup("startRanger", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufNew" }, {
-- 	group = "startRanger",
-- 	callback = function()
--     vim.cmd(":RnvimrStartBackground")
-- 	end,
-- })

-- api.nvim_create_augroup("startRanger", { clear = true })
-- api.nvim_create_autocmd({ "BufEnter", "BufNew" }, {
-- 	group = "startRanger",
-- 	callback = function()
--     vim.cmd(":RnvimrStartBackground")
-- 	end,
-- })

-- api.nvim_create_augroup("setWrapMargin", { clear = true })
-- api.nvim_create_autocmd({ "BufEnter", "BufNew" }, {
-- 	group = "setWrapMargin",
-- 	-- pattern = { "*.norg" },
-- 	callback = function()
-- 		vim.cmd([[set textwidth=78]])
--     vim.cmd([[set wrapmargin=10]])
-- 	end,
-- })

api.nvim_create_autocmd("ColorScheme", {
	callback = vim.schedule_wrap(function()
		vim.cmd([[highlight IndentBlanklineIndent1 guifg=#613b5d gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent2 guifg=#2c396b gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent3 guifg=#3b6161 gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent4 guifg=#595846 gui=nocombine]])

		-- Active/Inactive windows
		vim.cmd("highlight ActiveWindow guibg=#011826")
		vim.cmd("highlight InactiveWindow guibg=#000000")

		-- Active/Inactive winbar
		vim.cmd("hi WinBar guibg=#011826")
		vim.cmd("hi WinBarNC guibg=#000000")

		-- Line Number
		vim.cmd([[highlight LineNrAbove guifg=#011826]])
		vim.cmd([[highlight LineNrBelow guifg=#011826]])

		-- Rnvimr
		vim.cmd("hi RnvimrCurses guifg=#4d7277 guibg=#011826")

		-- Cursor Line
		vim.cmd("hi CursorLine guibg=#162e35")

		-- Folds
		vim.cmd("hi Folded guibg=#162e35 guifg=#1affff")

		-- Normal Float
		vim.cmd("hi NormalFloat guifg=#1affff guibg=#000000")
		-- Float Border
		vim.cmd("hi FloatBorder guifg=#011826 guibg=#011826")

		-- Neo Tree
		vim.cmd("highlight NeoTreeTabActive guifg=#1affff guibg=#011826")
		vim.cmd("hi NeoTreeWinSeparator guifg=#011826 guibg=#011826")
		vim.cmd("hi NeoTreeGitStaged guifg=#1aff94")
		vim.cmd("hi NeoTreeFloatTitle guifg=#011826 guibg=#011826")
		vim.cmd("hi NeoTreeFloatBorder guifg=#011826 guibg=#011826")

		-- Symbols Outline
		vim.cmd("hi FocusedSymbol guifg=#1affff guibg=#00363C")

		-- SpellBad
		vim.cmd("hi SpellBad gui=underline guisp=#FFC777")

		-- Navbuddy
		vim.cmd("hi NavbuddyNormalFloat guibg=#011826")

		-- Buffer line ?
		vim.cmd("highlight BufferTabpageFill guibg=#000000")
		vim.cmd("highlight BufferCurrent guifg=#1AFFFF guibg=#00363C")
		vim.cmd("highlight BufferVisible  guibg=#011826")
		vim.cmd("highlight BufferInactive guibg=#011826")
		vim.cmd("highlight BufferCurrentSign guibg=#000000")
		vim.cmd("highlight BufferVisibleSign guibg=#000000")
		vim.cmd("highlight BufferInactiveSign guibg=#000000")

		-- Buffer line
		vim.cmd("hi BufferLineSeparator guifg=#011826 guibg=#000000")

		-- Wilder Command Line
		vim.cmd("hi WilderPrompt guifg=#FFFFFF")
		vim.cmd("hi WilderBorder guifg=#1affff")
		vim.cmd("hi WilderDefault guifg=#80A0FF")
		vim.cmd("hi WilderSelected guifg=#1affff guibg=#244C58")

		-- Harpoon Menu
		-- vim.cmd("hi HarpoonBorder guifg=#1affff guibg=#011826")
		-- vim.cmd("hi HarpoonWindow guibg=#011826")

		-- General UI
		vim.cmd("hi EndOfBuffer guifg=#011826")
		vim.cmd("hi MsgSeparator guibg=#000000")
		vim.cmd("hi Pmenu guibg=#000000")
		vim.cmd("hi PmenuSel guifg=#1affff guibg=#244C58")
		vim.cmd("hi PmenuSbar guibg=#000000")
		vim.cmd("hi PmenuThumb guibg=#174B6B")

		-- Diagnostics ***I am probably repeating these highlights***
		vim.cmd("hi DiagnosticInfo guifg=#4FD6BE")
	end),
	group = vim.api.nvim_create_augroup("foo", {}),
})

vim.api.nvim_exec(
	[[
  augroup NoSpell
    autocmd!
    autocmd FileType Outline setlocal nospell
  augroup END
]],
	false
)

-- NOTE: Uncomment this
-- vim.cmd([[
--   augroup cursorline
--     autocmd!
--     autocmd WinEnter,BufEnter * lua vim.wo.cursorline = true
--     autocmd FileType TelescopePrompt lua vim.wo.cursorline = false
--     autocmd WinLeave,BufLeave * lua vim.wo.cursorline = false
--   augroup END
-- ]])

function InsertFooterTemplate()
	local template_path = vim.fn.expand("~/Neo-Brain/100 Templates/Footer Template.norg")
	local current_line = vim.fn.line(".")
	vim.cmd(current_line .. "read " .. template_path)

	-- Get the directory of the current file
	local current_file = vim.fn.expand("%:p")
	local current_directory = vim.fn.fnamemodify(current_file, ":h")

	-- Find the index file in the current directory
	local current_index_file = vim.fn.glob(current_directory .. "/*Index*")
	if not (type(current_index_file) == "string" and current_index_file == "") then
		local current_index_filename = vim.fn.fnamemodify(current_index_file, ":t:r")
		local current_index_relative_path = "./" .. vim.fn.fnamemodify(current_index_file, ":~:.:t:r")

		-- Append the string in the format "- [<filename>]{:<path-to-file>:}"
		vim.cmd("normal! Go- [" .. current_index_filename .. "]{:" .. current_index_relative_path .. ":}")
	end
end

vim.cmd("command! -nargs=0 InsertFooterTemplate lua InsertFooterTemplate()")

function InsertIndexTemplate()
	local template_path = vim.fn.expand("~/Neo-Brain/100 Templates/Index Template.norg")
	local current_line = vim.fn.line(".")
	vim.cmd(current_line .. "read " .. template_path)

	-- Get the directory of the current file
	local current_file = vim.fn.expand("%:p")
	local current_directory = vim.fn.fnamemodify(current_file, ":h")

	-- Get the parent directory
	local parent_directory = vim.fn.fnamemodify(current_directory, ":h")

	-- Find the index file in the parent directory
	local parent_index_file = vim.fn.glob(parent_directory .. "/*Index*")
	if not (type(parent_index_file) == "string" and parent_index_file == "") then
		local parent_index_filename = vim.fn.fnamemodify(parent_index_file, ":t:r")
		local parent_index_relative_path = "../" .. vim.fn.fnamemodify(parent_index_file, ":~:.:t:r")

		-- Append the string in the format "- [<filename>]{:<path-to-file>:}"
		vim.cmd("normal! Go- [" .. parent_index_filename .. "]{:" .. parent_index_relative_path .. ":}")
	end
end

vim.cmd("command! -nargs=0 InsertIndexTemplate lua InsertIndexTemplate()")

function InsertLitTemplate()
	local template_path = vim.fn.expand("~/Neo-Brain/100 Templates/Lit Template.norg")
	local current_line = vim.fn.line(".")
	vim.cmd(current_line .. "read " .. template_path)

	-- Get the directory of the current file
	local current_file = vim.fn.expand("%:p")
	local current_directory = vim.fn.fnamemodify(current_file, ":h")

	-- Get the parent directory
	local parent_directory = vim.fn.fnamemodify(current_directory, ":h")

	-- Find the index file in the parent directory
	local parent_index_file = vim.fn.glob(parent_directory .. "/*Index*")
	if not (type(parent_index_file) == "string" and parent_index_file == "") then
		local parent_index_filename = vim.fn.fnamemodify(parent_index_file, ":t:r")
		local parent_index_relative_path = "../" .. vim.fn.fnamemodify(parent_index_file, ":~:.:t:r")

		-- Append the string in the format "- [<filename>]{:<path-to-file>:}"
		vim.cmd("normal! Go- [" .. parent_index_filename .. "]{:" .. parent_index_relative_path .. ":}")
	end
end

vim.cmd("command! -nargs=0 InsertLitTemplate lua InsertLitTemplate()")

-- function InsertFooterTemplate()
--   local template_path = vim.fn.expand("~/Neo-Brain/100 Templates/Footer Template.norg")
--   local current_line = vim.fn.line('.')
--   vim.cmd(current_line .. "read " .. template_path)
-- end
--
-- vim.cmd("command! -nargs=0 InsertFooterTemplate lua InsertFooterTemplate()")

local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	-- FIX: Change back to 2
	conceallevel = 3,
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = false, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- display lines as one long line
	-- NOTE: Uncomment
	scrolloff = 8, -- is one of my fav
	-- scrolloff = 99, -- is one of my fav
	sidescrolloff = 8,
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	spell = true,
	spellsuggest = "10",
	-- NOTE: PART 2: Change back to 0 when creating plugin
	laststatus = 3,
	breakindent = true,
	-- NOTE: This indents wrapped lines
	-- breakindentopt = "shift:2,min:40,sbr",
	-- virtualedit = "all",
	winhighlight = "Normal:ActiveWindow,NormalNC:InactiveWindow",
	foldlevelstart = 99,
	linebreak = true,
	textwidth = 60,
	-- wrapmargin = 6,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set autochdir")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.rnvimr_enable_picker = 1
vim.g.rnvimr_enable_ex = 1
