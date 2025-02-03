local lint = require "lint"

lint.linters_by_ft = {
   lua = { "luacheck" },
   yaml = {
      "kubeconform",
      "kubescape"
   },
   helm = { "helm" },
   dockerfile = { "hadolint" },
}

lint.linters.luacheck.args = { "--globals", "love", "vim", "--formatter", "plain", "--codes", "--ranges", "-" }

lint.linters.kubescape = {
   cmd = "kubescape",
   args = {
      "scan",
      "--format", "json",
      "--file", "$FILENAME"
   },
   stream = "stdout",
   ignore_exitcode = true,
   parser = require("lint.parser").from_errorformat(
      [[%f:%l:%c: %m]],
      { source = "kubescape" }
   ),
}

lint.linters.kubeconform = {
   cmd = "kubeconform",
   args = {
      "-strict",
      "-summary",
      "-output", "pretty",
      "$FILENAME"
   },
   stream = "stdout",
   ignore_exitcode = true,
   parser = require("lint.parser").from_errorformat(
      [[%f:%l:%c %m]],
      { source = "kubeconform" }
   ),
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
   pattern = "*.yaml",
   callback = function()
      -- Wait for formatter to finish
      vim.defer_fn(lint.try_lint, 500)
   end,
})
