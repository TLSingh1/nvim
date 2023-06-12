local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.startup({
  function()

    -- NOTE: Base Plugins
    use("wbthomason/packer.nvim") -- Plugin Manager

    -- NOTE: My Plugins
    use({ "/home/tai/Code/side-projects/first-plugin.nvim" })

    -- NOTE: Core Plugins
    use({ "hrsh7th/nvim-cmp" })              -- Completion Plugin
    use({ "hrsh7th/cmp-nvim-lsp" })          -- lsp completion
    use({ "hrsh7th/cmp-buffer" })            -- buffer completion
    use({ "hrsh7th/cmp-path" })              -- path completion
    use({ "hrsh7th/cmp-cmdline" })           -- cmdline completion
    use({ "saadparwaiz1/cmp_luasnip" })      -- snippet completion
    use({ "rafamadriz/friendly-snippets" })  -- snippet repo
    use({ "L3MON4D3/LuaSnip" })              -- snippet repo
    use({
      "neovim/nvim-lspconfig",               -- Enable LSP
      "williamboman/mason.nvim",             -- LSP Installer
      "williamboman/mason-lspconfig.nvim",   -- Useful APIs
    })
    use({ "jose-elias-alvarez/null-ls.nvim" }) -- Null-LS
    use("folke/tokyonight.nvim")             -- Theme
    use({
      -- Syntax Highlighting
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
    })

    -- NOTE: Plugin SDKs
    use("nvim-lua/plenary.nvim")
    use("nvim-tree/nvim-web-devicons") -- Icons
    use({ "MunifTanjim/nui.nvim" })  -- UI elements

    -- NOTE: Features
    use({
      "Bryley/neoai.nvim",
      require = { "MunifTanjim/nui.nvim" }
    })
    use({ "jbyuki/venn.nvim" }) -- Diagrams
    use({
      -- Navic
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig",
    })
    use({
      "SmiteshP/nvim-navbuddy",
      requires = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
        "numToStr/Comment.nvim",
        "nvim-telescope/telescope.nvim",
      },
    })
    use({
      "toppair/peek.nvim",
      run = "deno task --quiet build:fast",
    })
    use({ "rcarriga/nvim-notify" }) -- Notifications
    use({ "github/copilot.vim" }) -- Copilot
    use({
      -- Dashboard
      "goolord/alpha-nvim",
      requires = { "nvim-tree/nvim-web-devicons" },
    })
    use({ "ahmedkhalf/project.nvim" }) -- Project Finder
    use({
      -- Bufferline
      "akinsho/bufferline.nvim",
      tag = "*",
      requires = "nvim-tree/nvim-web-devicons",
    })
    use({ "akinsho/toggleterm.nvim", version = "*" }) -- Terminal
    use({
      -- Telescope
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({ "s1n7ax/nvim-window-picker", tag = "v1.*" }) -- window picker
    use({
      -- Neo Tree
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
    })
    use({ "simrat39/symbols-outline.nvim" }) -- Symbols Outline
    use({ "rebelot/heirline.nvim" })       -- status lines

    -- NOTE: UI / UX / QoL

    use({
      "epwalsh/obsidian.nvim",
      config = function()
        require("obsidian").setup({
          use_advanced_uri = true,
          dir = "~/brain",
          completion = {
            nvim_cmp = true,
          },
          note_id_func = function(title)
            local sane_name = ""
            if title ~= nil then
              -- If title is given, transform it into valid file name.
              sane_name = title:gsub(" ", "_"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
              -- If title is nil, just add 4 random uppercase letters to the suffix.
              for _ in 1, 4 do
                sane_name = sane_name .. string.char(math.random(65, 90))
              end
            end
            return sane_name
          end,
          follow_url_func = function(url)
            vim.fn.jobstart({"xdg-open", url})  -- linux
          end,
          templates = {
            subdir = "Templates",
            date_format = "%a-%m-%d-%Y",
            time_format = "%H:%M",
          },
        })
        vim.keymap.set("n", "gd", function ()
          if require("obsidian").util.cursor_on_markdown_link() then
            return "<cmd>ObsidianFollowLink<CR>"
          else
            return "gd"
          end
        end)
      end,
    })

    use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" })
    use({ "smjonas/inc-rename.nvim" })         -- Rename
    use({ "Pocco81/true-zen.nvim" })           -- Better Zen Mode
    use({ "folke/twilight.nvim" })             -- Twilight
    use({ "ThePrimeagen/harpoon" })            -- Harpoon
    use("lukas-reineke/indent-blankline.nvim") -- Indent Lines
    use({ "norcalli/nvim-colorizer.lua" })     -- Colorizer
    use({ "kylechui/nvim-surround", tag = "*" }) -- Surround Selections
    use({ "windwp/nvim-autopairs" })           -- Auto Pairs
    use({ "windwp/nvim-ts-autotag" })          -- Auto Tags
    use({ "nvim-zh/colorful-winsep.nvim" })    -- Window Separators
    use({
      "folke/noice.nvim",
      requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
    })
    use({ "gelguy/wilder.nvim" })                     -- Command Line
    use({ "lewis6991/gitsigns.nvim", tag = "release" }) -- Git Signs
    use({ "ggandor/leap.nvim" })                      -- Leap
    use({ "phaazon/hop.nvim", branch = "v2" })        -- Better Navigation
    use({ "rlane/pounce.nvim" })                      -- Better (better?) Navigation
    use({ "mrjones2014/smart-splits.nvim" })          -- Smart Splits
    use({ "numToStr/Comment.nvim" })                  -- Better Comments
    use("JoosepAlviste/nvim-ts-context-commentstring") -- TSX/JSX/HTML Comments
    use({ "jose-elias-alvarez/typescript.nvim" })     -- Typescript Stuff
    use({
      -- Find and Search comments
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
    })

    -- NOTE: Neorg
    use {
      "nvim-neorg/neorg",
      config = function()
        require('neorg').setup {
          load = {
            ["core.defaults"] = {},
            ["core.itero"] = {},
            ["core.keybinds"] = {
              config = {
                hook = function (keybinds)
                  keybinds.unmap("norg", "n", "<LocalLeader>li")
                  keybinds.remap_key("norg", "n", "<LocalLeader>lt", "<LocalLeader>nL")
                  keybinds.remap_key("norg", "i", "<M-CR>", "<S-CR>")
                end,
              }
            },
            ["core.esupports.metagen"] = {
              config = {
                type = "auto",
              }
            },
            ["core.presenter"] = {
              config = {
                zen_mode = "truezen"
              }
            },
            ["core.concealer"] = {
              config = {
                icon_preset = "varied"
              }
            },
            ["core.dirman"] = {
              config = {
                workspaces = {
                  neorg_brain = "~/neorg-brain",
                },
                index = "index.norg",
                default_workspace = "neorg_brain",
              }
            },
            ["core.export"] = {
              config = {
                export_dir = "~/test"
              }
            },
            ["core.export.markdown"] = {},
            ["core.completion"] = {
              config = {
                engine = "nvim-cmp",
                name = "[Neorg]"
              }
            },
          }
        }
      end,
      run = ":Neorg sync-parsers",
      requires = "nvim-lua/plenary.nvim",
      tag = "*",
    }
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
