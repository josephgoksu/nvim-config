local M = {}

-- Formatter configurations using conform.nvim
M.conform = {
   formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofumpt", "goimports-reviser", "golines" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier", "eslint_d" },
      javascriptreact = { "prettier", "eslint_d" },
      typescript = { "prettier", "eslint_d" },
      typescriptreact = { "prettier", "eslint_d" },
      json = { "prettier", "jq" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      astro = { "prettier", "eslint_d" },
      sh = { "shellcheck" },
   },

   formatters = {
      ["goimports-reviser"] = {
         prepend_args = { "-rm-unused" },
      },
      golines = {
         prepend_args = { "--max-len=80" },
      },
      eslint_d = {
         lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
         lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %trror %m" },
         lintStdin = true,
         lintIgnoreExitCode = true,
         lintSource = "eslint",
         formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
         formatStdin = true,
      },
      prettier = {
         formatCommand = 'prettierd "${INPUT}"',
         formatStdin = true,
      },
      -- Add other formatter-specific configs here
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
