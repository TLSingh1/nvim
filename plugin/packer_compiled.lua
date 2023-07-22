-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/tai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/tai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/tai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/tai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/tai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["colorful-winsep.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/colorful-winsep.nvim",
    url = "https://github.com/nvim-zh/colorful-winsep.nvim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["flash.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/flash.nvim",
    url = "https://github.com/folke/flash.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["heirline.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/heirline.nvim",
    url = "https://github.com/rebelot/heirline.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["inc-rename.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/inc-rename.nvim",
    url = "https://github.com/smjonas/inc-rename.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["leap.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp_lines.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mdeval.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/mdeval.nvim",
    url = "https://github.com/jubnzv/mdeval.nvim"
  },
  ["minimap.lua"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/minimap.lua",
    url = "https://github.com/yavko/minimap.lua"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neoai.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/neoai.nvim",
    url = "https://github.com/Bryley/neoai.nvim"
  },
  neorg = {
    config = { "\27LJ\2\n¦\1\0\1\a\0\n\0\0189\1\0\0'\3\1\0'\4\2\0'\5\3\0B\1\4\0019\1\4\0'\3\1\0'\4\2\0'\5\5\0'\6\6\0B\1\5\0019\1\4\0'\3\1\0'\4\a\0'\5\b\0'\6\t\0B\1\5\1K\0\1\0\v<S-CR>\v<M-CR>\6i\20<LocalLeader>nL\20<LocalLeader>lt\14remap_key\20<LocalLeader>li\6n\tnorg\nunmapã\6\1\0\t\0.\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2,\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\t\0005\5\a\0003\6\6\0=\6\b\5=\5\n\4=\4\v\0035\4\r\0005\5\f\0=\5\n\4=\4\14\0035\4\16\0005\5\15\0=\5\n\4=\4\17\0035\4\30\0005\5\18\0005\6\22\0005\a\20\0005\b\19\0=\b\21\a=\a\23\0065\a\24\0004\b\0\0=\b\25\a5\b\26\0=\b\27\a=\a\28\6=\6\29\5=\5\n\4=\4\31\0035\4#\0005\5!\0005\6 \0=\6\"\5=\5\n\4=\4$\0035\4&\0005\5%\0=\5\n\4=\4'\0034\4\0\0=\4(\0035\4*\0005\5)\0=\5\n\4=\4+\3=\3-\2B\0\2\1K\0\1\0\tload\1\0\0\20core.completion\1\0\0\1\0\2\vengine\rnvim-cmp\tname\f[Neorg]\25core.export.markdown\16core.export\1\0\0\1\0\1\15export_dir\v~/test\16core.dirman\1\0\0\15workspaces\1\0\2\nindex\15index.norg\22default_workspace\14neo_brain\1\0\1\14neo_brain\16~/Neo-Brain\19core.concealer\1\0\0\nicons\15code_block\nnodes\1\2\0\0\24ranged_verbatim_tag\fpadding\1\0\5\nwidth\fcontent\17content_only\2\19insert_enabled\2\fconceal\2\14highlight\15CursorLine\14delimiter\1\0\0\20horizontal_line\1\0\0\1\0\1\14highlight&@neorg.delimiters.horizontal_line\1\0\1\16icon_preset\vvaried\19core.presenter\1\0\0\1\0\1\rzen_mode\ftruezen\27core.esupports.metagen\1\0\0\1\0\1\ttype\tauto\18core.keybinds\vconfig\1\0\0\thook\1\0\0\0\15core.itero\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["noice.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navbuddy"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-navbuddy",
    url = "https://github.com/SmiteshP/nvim-navbuddy"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["obsidian.nvim"] = {
    config = { "\27LJ\2\nÉ\1\0\1\r\0\n\0#'\1\0\0\n\0\0\0X\2\15€\18\4\0\0009\2\1\0'\5\2\0'\6\3\0B\2\4\2\18\4\2\0009\2\1\2'\5\4\0'\6\0\0B\2\4\2\18\4\2\0009\2\5\2B\2\2\2\18\1\2\0X\2\16€)\2\1\0)\3\4\0+\4\0\0X\5\n€\18\6\1\0006\a\6\0009\a\a\a6\t\b\0009\t\t\t)\vA\0)\fZ\0B\t\3\0A\a\0\2&\1\a\6E\5\3\2R\5ô\127L\1\2\0\vrandom\tmath\tchar\vstring\nlower\18[^A-Za-z0-9-]\6_\6 \tgsub\5@\0\1\4\0\4\0\a6\1\0\0009\1\1\0019\1\2\0015\3\3\0>\0\2\3B\1\2\1K\0\1\0\1\2\0\0\rxdg-open\rjobstart\afn\bvimŒ\1\0\0\3\0\6\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0B\0\1\2\15\0\0\0X\1\3€'\0\4\0L\0\2\0X\0\2€'\0\5\0L\0\2\0K\0\1\0\agd <cmd>ObsidianFollowLink<CR>\28cursor_on_markdown_link\tutil\robsidian\frequire«\2\1\0\5\0\18\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0'\3\16\0003\4\17\0B\0\4\1K\0\1\0\0\agd\6n\bset\vkeymap\bvim\14templates\1\0\3\16date_format\16%a-%m-%d-%Y\16time_format\n%H:%M\vsubdir\14Templates\20follow_url_func\0\17note_id_func\0\15completion\1\0\1\rnvim_cmp\2\1\0\2\21use_advanced_uri\2\bdir\f~/brain\nsetup\robsidian\frequire\0" },
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/obsidian.nvim",
    url = "https://github.com/epwalsh/obsidian.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["peek.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/peek.nvim",
    url = "https://github.com/toppair/peek.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pounce.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/pounce.nvim",
    url = "https://github.com/rlane/pounce.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["rest.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/rest.nvim",
    url = "https://github.com/rest-nvim/rest.nvim"
  },
  rnvimr = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/rnvimr",
    url = "https://github.com/kevinhwang91/rnvimr"
  },
  ["smart-splits.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
  },
  ["solid-snippets"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/solid-snippets",
    url = "https://github.com/solidjs-community/solid-snippets"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["true-zen.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/true-zen.nvim",
    url = "https://github.com/loqusion/true-zen.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["venn.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/venn.nvim",
    url = "https://github.com/jbyuki/venn.nvim"
  },
  ["wilder.nvim"] = {
    loaded = true,
    path = "/home/tai/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: obsidian.nvim
time([[Config for obsidian.nvim]], true)
try_loadstring("\27LJ\2\nÉ\1\0\1\r\0\n\0#'\1\0\0\n\0\0\0X\2\15€\18\4\0\0009\2\1\0'\5\2\0'\6\3\0B\2\4\2\18\4\2\0009\2\1\2'\5\4\0'\6\0\0B\2\4\2\18\4\2\0009\2\5\2B\2\2\2\18\1\2\0X\2\16€)\2\1\0)\3\4\0+\4\0\0X\5\n€\18\6\1\0006\a\6\0009\a\a\a6\t\b\0009\t\t\t)\vA\0)\fZ\0B\t\3\0A\a\0\2&\1\a\6E\5\3\2R\5ô\127L\1\2\0\vrandom\tmath\tchar\vstring\nlower\18[^A-Za-z0-9-]\6_\6 \tgsub\5@\0\1\4\0\4\0\a6\1\0\0009\1\1\0019\1\2\0015\3\3\0>\0\2\3B\1\2\1K\0\1\0\1\2\0\0\rxdg-open\rjobstart\afn\bvimŒ\1\0\0\3\0\6\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0B\0\1\2\15\0\0\0X\1\3€'\0\4\0L\0\2\0X\0\2€'\0\5\0L\0\2\0K\0\1\0\agd <cmd>ObsidianFollowLink<CR>\28cursor_on_markdown_link\tutil\robsidian\frequire«\2\1\0\5\0\18\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0'\3\16\0003\4\17\0B\0\4\1K\0\1\0\0\agd\6n\bset\vkeymap\bvim\14templates\1\0\3\16date_format\16%a-%m-%d-%Y\16time_format\n%H:%M\vsubdir\14Templates\20follow_url_func\0\17note_id_func\0\15completion\1\0\1\rnvim_cmp\2\1\0\2\21use_advanced_uri\2\bdir\f~/brain\nsetup\robsidian\frequire\0", "config", "obsidian.nvim")
time([[Config for obsidian.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n¦\1\0\1\a\0\n\0\0189\1\0\0'\3\1\0'\4\2\0'\5\3\0B\1\4\0019\1\4\0'\3\1\0'\4\2\0'\5\5\0'\6\6\0B\1\5\0019\1\4\0'\3\1\0'\4\a\0'\5\b\0'\6\t\0B\1\5\1K\0\1\0\v<S-CR>\v<M-CR>\6i\20<LocalLeader>nL\20<LocalLeader>lt\14remap_key\20<LocalLeader>li\6n\tnorg\nunmapã\6\1\0\t\0.\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2,\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\t\0005\5\a\0003\6\6\0=\6\b\5=\5\n\4=\4\v\0035\4\r\0005\5\f\0=\5\n\4=\4\14\0035\4\16\0005\5\15\0=\5\n\4=\4\17\0035\4\30\0005\5\18\0005\6\22\0005\a\20\0005\b\19\0=\b\21\a=\a\23\0065\a\24\0004\b\0\0=\b\25\a5\b\26\0=\b\27\a=\a\28\6=\6\29\5=\5\n\4=\4\31\0035\4#\0005\5!\0005\6 \0=\6\"\5=\5\n\4=\4$\0035\4&\0005\5%\0=\5\n\4=\4'\0034\4\0\0=\4(\0035\4*\0005\5)\0=\5\n\4=\4+\3=\3-\2B\0\2\1K\0\1\0\tload\1\0\0\20core.completion\1\0\0\1\0\2\vengine\rnvim-cmp\tname\f[Neorg]\25core.export.markdown\16core.export\1\0\0\1\0\1\15export_dir\v~/test\16core.dirman\1\0\0\15workspaces\1\0\2\nindex\15index.norg\22default_workspace\14neo_brain\1\0\1\14neo_brain\16~/Neo-Brain\19core.concealer\1\0\0\nicons\15code_block\nnodes\1\2\0\0\24ranged_verbatim_tag\fpadding\1\0\5\nwidth\fcontent\17content_only\2\19insert_enabled\2\fconceal\2\14highlight\15CursorLine\14delimiter\1\0\0\20horizontal_line\1\0\0\1\0\1\14highlight&@neorg.delimiters.horizontal_line\1\0\1\16icon_preset\vvaried\19core.presenter\1\0\0\1\0\1\rzen_mode\ftruezen\27core.esupports.metagen\1\0\0\1\0\1\ttype\tauto\18core.keybinds\vconfig\1\0\0\thook\1\0\0\0\15core.itero\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
