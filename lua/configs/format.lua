local eslint = {
   lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
   lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %trror %m" },
   lintStdin = true,
   lintIgnoreExitCode = true,
   lintSource = "eslint",
   formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
   formatStdin = true,
}

local jq = {
   lintCommand = "jq .",
   lintFormats = { "parse %trror: %m at line %l, column %c" },
   lintSource = "jq",
}

local nix = {
   formatCommand = "alejandra -qq",
   formatStdin = true,
}

local prettier = {
   formatCommand = 'prettierd "${INPUT}"',
   formatStdin = true,
}

local shellcheck = {
   lintCommand = "shellcheck -f gcc -x -",
   lintStdin = true,
   lintFormats = {
      "%f:%l:%c: %trror: %m",
      "%f:%l:%c: %tarning: %m",
      "%f:%l:%c: %tote: %m",
   },
   lintSource = "shellcheck",
}

return {
   astro = { prettier, eslint },
   css = { prettier },
   html = { prettier },
   javascript = { prettier, eslint },
   javascriptreact = { prettier, eslint },
   json = { prettier, jq },
   markdown = { prettier },
   nix = { nix },
   sh = { shellcheck },
   typescript = { prettier, eslint },
   typescriptreact = { prettier, eslint },
   yaml = { prettier },
}
