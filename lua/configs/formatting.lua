local M = {}

-- Formatter configurations
M.formatters = {
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
}

-- Formatter-specific configurations
M.formatter_config = {
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
   jq = {
      lintCommand = "jq .",
      lintFormats = { "parse %trror: %m at line %l, column %c" },
      lintSource = "jq",
   },
   prettier = {
      formatCommand = 'prettierd "${INPUT}"',
      formatStdin = true,
   },
   shellcheck = {
      lintCommand = "shellcheck -f gcc -x -",
      lintStdin = true,
      lintFormats = {
         "%f:%l:%c: %trror: %m",
         "%f:%l:%c: %tarning: %m",
         "%f:%l:%c: %tote: %m",
      },
      lintSource = "shellcheck",
   },
}

-- Format on save configuration
M.format_on_save = {
   timeout_ms = 500,
   lsp_fallback = true,
}

return M
