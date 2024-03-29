-- NOTE: Base Configs
require("plugins")
require("options")
require("keymaps")

-- NOTE: Core Configs
require("treesitter-config") -- Syntax Highlighting
require("cmp-config")        -- Auto Completions
require("mason-config")      -- LSP Installer
require("lsp")               -- Language Servers
require("tokyonight-config") -- Base Theme

-- NOTE: SDKs
require("icons-config")

-- NOTE: Features
-- require("venn-config")            -- Diagrams
-- require("rest-config") -- REST Client
-- require("ufo-config")           -- UFO
require("codewindow-config")    -- Code Window
require("mdeval-config")        -- Markdown Eval
require("neoai-config")         -- ChatGPT
require("alpha-config")         -- Dashboard
require("project-config")       -- Project Finder
require("bufferline-config")    -- Buffer line
require("toggleterm-config")    -- Floating Terminal
require("telescope-config")     -- Multi Purpose Picker
require("neo-tree-config")      -- File Tree
require("window-picker-config") -- Window Picker
require("navbuddy-config")      -- Code Outline
require("peek-config")          -- Peek
require("heirline-config")      -- Status Line + Winbar
require("notify-config")        -- Notifications

-- NOTE: UI / UX / QoL
require("lsp_lines-config")  -- LSP Lines
require("inc_rename-config") -- Incremental Renaming
require("colorizer-config")        -- Color Codes
require("indent-blankline-config") -- Indent Lines
require("autopairs-config")        -- Auto Pairs
require("surround-config")         -- Surround Pairs
require("ts-autotag-config")       -- Auto Tags
require("git-signs-config")        -- Git Indicators
require("colorful-winsep-config")  -- Window Separator
require("noice-config")            -- Better CmdLine
require("hop-config")              -- Better Navigation
require("smart-splits-config")     -- Smart Splits
require("comment-config")          -- Better Comments
require("typescript-config")       -- Typescript Stuff
require("todo-comments-config")    -- Find and Search comments

vim.cmd("colorscheme tokyonight-moon")
