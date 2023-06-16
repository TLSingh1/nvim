local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- vim.api.nvim_exec([[
--   autocmd FileType man nnoremap <buffer> gd <C-]>
-- ]], false)

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

keymap("n", "<leader>z", "za", opts)

-- Spell
keymap("n", "<leader>ns", ":set nospell <CR>", { silent = true })
keymap("n", "<leader>nS", ":set spell <CR>", { silent = true })

-- Hop
keymap("n", "f", ":HopWord <CR>", opts)
keymap("n", "F", ":HopLine <CR>", opts)
keymap("n", "<C-f>", ":HopChar1 <CR>", opts)
keymap("v", "f", "<cmd>HopLine <CR>", opts)

-- Resize with Smart Splits
keymap("n", "<C-h>", ":SmartResizeLeft <CR>", { silent = true })
keymap("n", "<C-l>", ":SmartResizeRight <CR>", { silent = true })
keymap("n", "<C-j>", ":SmartResizeDown <CR>", { silent = true })
keymap("n", "<C-k>", ":SmartResizeUp <CR>", { silent = true })

-- Better formatting
keymap("n", "<leader>a", ":Format<CR>", opts)

-- Zen Mode
keymap("n", "<leader>m", ":TZAtaraxis <CR>", opts)

-- Better splitting
keymap("n", "<leader>d", ":vs <CR>", opts)
keymap("n", "<leader>s", ":split <CR>", opts)
keymap("n", "<leader>c", ":q <cr>", opts)
keymap("n", "<c-n>", ":bdelete <cr>", opts)

-- Swap buffers
local smart_splits = require("smart-splits")

local function swap_and_move(key)
  if key == "<leader><leader>h" then
    smart_splits.swap_buf_left()
    smart_splits.move_cursor_left()
  elseif key == "<leader><leader>l" then
    smart_splits.swap_buf_right()
    smart_splits.move_cursor_right()
  elseif key == "<leader><leader>k" then
    smart_splits.swap_buf_up()
    smart_splits.move_cursor_up()
  elseif key == "<leader><leader>j" then
    smart_splits.swap_buf_down()
    smart_splits.move_cursor_down()
  end
end

vim.keymap.set("n", "<leader><leader>h", function()
  swap_and_move("<leader><leader>h")
end)
vim.keymap.set("n", "<leader><leader>l", function()
  swap_and_move("<leader><leader>l")
end)
vim.keymap.set("n", "<leader><leader>k", function()
  swap_and_move("<leader><leader>k")
end)
vim.keymap.set("n", "<leader><leader>j", function()
  swap_and_move("<leader><leader>j")
end)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- File Tree
keymap("n", "z", ":RnvimrToggle <CR>", opts)
keymap("n", "Z", ":NeoTreeFocusToggle<CR>", opts)

-- NeoAI
keymap("n", "<leader>e", ":NeoAIToggle <CR>", opts)
keymap("v", "<leader>e", ":NeoAIContext <CR>", opts)

-- Symbols / Code Outline
keymap("n", ";", ":Navbuddy <CR>", opts)

-- Symbols Tree
-- keymap("n", ";", ":SymbolsOutline <CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("n", "<leader>w", ":w <cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope --
keymap(
  "n",
  "<leader>f",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
  opts
)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>u", ":Telescope current_buffer_fuzzy_find <CR>", opts)
keymap("n", "<leader>i", ":Telescope diagnostics <CR>", opts)
keymap("n", "<leader>o", ":TodoTelescope  <cr>", opts)

-- Obsidian
keymap("n", "<leader>ot", ":ObsidianTemplate <cr>", opts)

-- Incremental Rename
keymap("n", "<leader>r", ":IncRename ", opts)

-- LSP Lines
keymap("n", "<leader>K", ':lua require("lsp_lines").toggle()<CR>', opts)

-- Harpoon
-- keymap('n', '<leader>e', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
-- keymap('n', '<leader>r', '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
keymap("n", "<leader><leader>a", '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', opts)
keymap("n", "<leader><leader>s", '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', opts)
keymap("n", "<leader><leader>d", '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', opts)
keymap("n", "<leader><leader>f", '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', opts)
keymap("n", "<leader><leader>g", '<cmd>lua require("harpoon.ui").nav_file(5)<CR>', opts)

-- keymap("n", "<leader>v", ":Telescope spell_check <CR>", opts)

-- Dictionary
keymap("n", "<leader>x", "zg", opts)
keymap("n", "<leader>X", "zw", opts)
keymap("n", "<leader>p", "z=", opts)

-- Venn
-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == "nil" then
    vim.b.venn_enabled = true
    vim.cmd([[setlocal ve=all]])
    -- draw a line on HJKL keystokes
    vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
    -- draw a box by pressing "f" with visual selection
    vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
  else
    vim.cmd([[setlocal ve=]])
    vim.cmd([[mapclear <buffer>]])
    vim.b.venn_enabled = nil
  end
end

-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap("n", "<leader>v", ":lua Toggle_venn()<CR>", { noremap = true })

-- keymap.set("n", "<leader>v", function()
--
-- end, { desc = "Spelling Suggestions" })

-- keymap("n", "<leader>v", ":TodoTrouble <cr>", opts)
-- keymap("n", ";", ":Telescope diagnostics<CR>", opts)

-- keymap("n", ";", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- keymap("n", ";", ":SymbolsOutline <CR>", opts)
--[[ keymap("n", "<M-;>", ":ToggleTerm <CR>", opts) ]]
--[[ keymap("n", ";", ":<CR>", opts) ]]
--[[ keymap("n", "<leader>w <cr>", ":w", opts) ]]
--[[ keymap("n", "<c-[>", "<cmd>SymbolsOutline<CR>", opts) ]]

-- RE ENABLE THESE
-- vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
-- vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
-- vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
-- vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
