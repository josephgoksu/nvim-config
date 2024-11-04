local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- list of all servers configured.
lspconfig.servers = { "lua_ls", "ts_ls", "gopls", "clojure_lsp", "prismals" }

-- list of servers configured with default config.
local default_servers = { "html", "cssls", "clangd", "pyright", "bashls", "awk_ls" }

-- lsps with default config
for _, lsp in ipairs(default_servers) do
   lspconfig[lsp].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
   }
end

vim.api.nvim_create_autocmd("LspAttach", {
   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
   callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      local opts = {
         buffer = ev.buf,
      }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wl", function()
         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>f", function()
         vim.lsp.buf.format {
            async = true,
         }
      end, opts)
   end,
})

lspconfig.lua_ls.setup {
   on_attach = on_attach,
   on_init = on_init,
   capabilities = capabilities,

   settings = {
      Lua = {
         diagnostics = {
            enable = false, -- Disable all diagnostics from lua_ls
            -- globals = { "vim" },
         },
         workspace = {
            library = {
               vim.fn.expand "$VIMRUNTIME/lua",
               vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
               vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
               vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
               "${3rd}/love2d/library",
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
         },
      },
   },
}

lspconfig.gopls.setup {
   on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      on_attach(client, bufnr)
   end,
   on_init = on_init,
   capabilities = capabilities,
   cmd = { "gopls" },
   filetypes = { "go", "gomod", "gotmpl", "gowork" },
   root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
   settings = {
      gopls = {
         analyses = {
            unusedparams = true,
         },
         completeUnimported = true,
         usePlaceholders = true,
         staticcheck = true,
      },
   },
}

lspconfig.ts_ls.setup {
   on_attach = on_attach,
   on_init = on_init,
   capabilities = capabilities,
}

lspconfig.r_language_server.setup {}

-- Add ESLint configuration
lspconfig.eslint.setup {
   on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
      on_attach(client, bufnr)

      -- Run ESLint fix on save
      vim.api.nvim_create_autocmd("BufWritePre", {
         buffer = bufnr,
         command = "EslintFixAll",
      })
   end,
   on_init = on_init,
   capabilities = capabilities,
   settings = {
      workingDirectory = {
         mode = "auto",
      },

      format = {
         enable = true,
      },
   },
}

require("lspconfig").clojure_lsp.setup {}

require("lspconfig").prismals.setup {}
