local formatting = require("configs.formatting")

return {
   {
      "stevearc/conform.nvim",
      event = "BufWritePre",
      opts = {
         formatters_by_ft = formatting.formatters,
         formatters = formatting.formatter_config,
         format_on_save = formatting.format_on_save,
      },
   },
   {
      "neovim/nvim-lspconfig",
      config = function()
         require "configs.lspconfig"
      end,
   },
   {
      "nvim-treesitter/nvim-treesitter",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         require "configs.treesitter"
      end,
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
}
