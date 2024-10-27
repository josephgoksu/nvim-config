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
}
