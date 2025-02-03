local options = {
   ensure_installed = {
      "bash",
      "fish",
      "lua",
      "luadoc",
      "markdown",
      "printf",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
      "go",
      "gomod",
      "gosum",
      "gotmpl",
      "gowork",
      "typescript",
      "javascript",
      "python",
      "json",
      "jsonc",
      "html",
      "css",
      "scss",
      "helm",
      "hcl",
      "dockerfile",
   },

   highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = { "markdown" },
   },

   indent = {
      enable = true,
   },

   context_commentstring = {
      enable = true,
      enable_autocmd = false,
   },
}

require("nvim-treesitter.configs").setup(options)
