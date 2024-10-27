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
      yaml = { "prettier" },
      markdown = { "prettier" },
      astro = { "prettier" },
      sh = { "shellcheck" },
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
