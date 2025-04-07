--[[
  Formatting configuration
  This file centralizes all formatting-related configurations.
  It defines:
  - Which formatters to use for which file types
  - Custom formatter configurations
  - Format-on-save settings
  - Mason formatter installation settings
--]]

local M = {}

-- Formatter configurations using conform.nvim
M.conform = {
   formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofumpt", "goimports-reviser", "golines" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier", "jq" },
      yaml = { "yamlfmt" },
      markdown = { "prettier" },
      astro = { "prettier" },
      helm = { "helmfmt" },
      terraform = { "terraform_fmt" },
      dockerfile = { "dockerfmt" },
   },

   formatters = {
      ["goimports-reviser"] = {
         prepend_args = { "-rm-unused" },
      },
      golines = {
         prepend_args = { "--max-len=80" },
      },
      prettier = {
         formatCommand = 'prettierd "${INPUT}"',
         formatStdin = true,
      },
      yamlfmt = {
         command = "yamlfmt",
         args = { "--retain-line-breaks", "-" },
         stdin = true,
      },
      dockerfmt = {
         command = "dockfmt",
         args = { "fmt", "$FILENAME" },
         runtime_condition = function()
            return vim.fn.executable("dockfmt") == 1
         end
      },
      helmfmt = {
         command = "helm",
         args = { "template", "$FILENAME" },
         runtime_condition = function()
            return vim.fn.executable("helm") == 1
         end
      }
   },

   format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
   },
}

-- Mason-conform configuration
M.mason = {
   ignore_install = {},
}

return M
