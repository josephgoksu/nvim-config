local formatting = require "configs.formatting"

return {
   {
      "stevearc/conform.nvim",
      event = "BufWritePre",
      opts = {
         formatters_by_ft = formatting.conform.formatters_by_ft,
         formatters = formatting.conform.formatters,
         format_on_save = formatting.conform.format_on_save,
      },
   },
   {
      "nvim-treesitter/nvim-treesitter",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         require "configs.treesitter"
      end,
   },
   {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         require("nvchad.configs.lspconfig").defaults()
         require "configs.lspconfig"
      end,
   },
   {
      "mfussenegger/nvim-lint",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         require "configs.lint"
      end,
   },
   {
      "zapling/mason-conform.nvim",
      event = "VeryLazy",
      dependencies = { "conform.nvim" },
      config = function()
         require "configs.mason-conform"
      end,
   },
   {
      "williamboman/mason-lspconfig.nvim",
      event = "VeryLazy",
      dependencies = { "nvim-lspconfig" },
      config = function()
         require "configs.mason-lspconfig"
      end,
   },
   {
      "rshkarin/mason-nvim-lint",
      event = "VeryLazy",
      dependencies = { "nvim-lint" },
      config = function()
         require "configs.mason-lint"
      end,
   },
   {
      "tpope/vim-fugitive",
      cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gwrite", "Gread" },
      event = "VeryLazy",
   },
   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {},
      keys = {
         {
            "<leader>?",
            function()
               require("which-key").show { global = false }
            end,
            desc = "Buffer Local Keymaps (which-key)",
         },
      },
   },
   {
      "stevearc/dressing.nvim",
      opts = {},
   },
   {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {
         indent = {
            char = "│",
            tab_char = "│",
         },
         scope = {
            enabled = true,
            show_start = true,
            show_end = true,
            injected_languages = true,
            highlight = { "Function", "Label" },
            priority = 500,
         },
         exclude = {
            filetypes = {
               "help",
               "dashboard",
               "lazy",
               "neogitstatus",
               "NvimTree",
               "Trouble",
               "text",
            },
         },
      },
   },
   {
      "HiPhish/rainbow-delimiters.nvim",
      event = "BufReadPost",
      config = function()
         local rainbow_delimiters = require "rainbow-delimiters"

         vim.g.rainbow_delimiters = {
            strategy = {
               [""] = rainbow_delimiters.strategy["global"],
               commonlisp = rainbow_delimiters.strategy["local"],
            },
            query = {
               [""] = "rainbow-delimiters",
               lua = "rainbow-blocks",
            },
            highlight = {
               "RainbowDelimiterRed",
               "RainbowDelimiterYellow",
               "RainbowDelimiterBlue",
               "RainbowDelimiterOrange",
               "RainbowDelimiterGreen",
               "RainbowDelimiterViolet",
               "RainbowDelimiterCyan",
            },
            blacklist = { "c", "cpp" },
         }
      end,
   },
   {
      "nvim-treesitter/nvim-treesitter-context",
      event = "BufReadPre",
      opts = {
         enable = true,
         max_lines = 3,
         min_window_height = 0,
         line_numbers = true,
         multiline_threshold = 20,
         trim_scope = "outer",
         mode = "cursor",
         separator = nil,
         zindex = 20,
      },
   },
   {
      "folke/trouble.nvim",
      cmd = { "TroubleToggle", "Trouble" },
      opts = {
         position = "bottom",
         height = 10,
         width = 50,
         icons = true,
         mode = "workspace_diagnostics",
         severity = nil,
         fold_open = "",
         fold_closed = "",
         group = true,
         padding = true,
         cycle_results = true,
         action_keys = {
            close = "q",
            cancel = "<esc>",
            refresh = "r",
            jump = { "<cr>", "<tab>" },
            open_split = { "<c-x>" },
            open_vsplit = { "<c-v>" },
            open_tab = { "<c-t>" },
            jump_close = { "o" },
            toggle_mode = "m",
            switch_severity = "s",
            toggle_preview = "P",
            hover = "K",
            preview = "p",
            close_folds = { "zM", "zm" },
            open_folds = { "zR", "zr" },
            toggle_fold = { "zA", "za" },
            previous = "k",
            next = "j",
         },
         multiline = true,
         indent_lines = true,
         win_config = { border = "single" },
         auto_open = false,
         auto_close = false,
         auto_preview = true,
         auto_fold = false,
         auto_jump = { "lsp_definitions" },
         use_diagnostic_signs = true,
      },
      keys = {
         { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
         { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
         { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List" },
         { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List" },
      },
   },
}
