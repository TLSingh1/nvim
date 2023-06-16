vim.notify = require("notify")

require("noice").setup({
  routes = {
    {
      filter = {
        error = true,
        find = "written",
      },
      opts = { skip = true },
    },
    {
      filter = {
        error = true,
        find = "assertion",
      },
      opts = { skip = true },
    },
    {
      filter = {
        error = true,
        find = "change",
      },
      opts = { skip = true },
    },
    {
      filter = {
        error = true,
        find = "tailwindcss",
      },
      opts = { skip = true },
    },
    {
      filter = {
        find = "diagnostics_on_open",
      },
      opts = { skip = true },
    },
    {
      filter = {
        find = "diagnostics",
      },
      opts = { skip = true },
    },
    {
      view = "mini",
      filter = {
        find = "written",
      }
    },
    {
      view = "mini",
      filter = {
        find = "yanked",
      }
    },
    {
      view = "mini",
      filter = {
        find = "change",
      }
    },
    {
      view = "mini",
      filter = {
        find = "lines",
      }
    },
    {
      view = "notify",
      filter = {
        event = "msg_showmode",
      }
    },
  },
  views = {
    cmdline_popup = {
      position = {
        row = "50%",
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
      -- win_options = {
        -- winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        -- winhighlight = { Normal = "ActiveWindow", FloatBorder = "DiagnosticInfo" },
      -- },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = "73%",
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        -- winhighlight = { Normal = "ActiveWindow", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
  messages = {
    enabled = true,
    view = "notify",
    view_error = "notify",
    view_warn = "notify",
    view_history= "messages",
    view_search = "virtualtext",
  },
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true,       -- use a classic bottom cmdline for search
    command_palette = true,     -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = true,         -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,     -- add a border to hover docs and signature help
  },
})
