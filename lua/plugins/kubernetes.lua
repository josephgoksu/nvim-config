return {
     {
      "rafamadriz/friendly-snippets",
      config = function()
         require("luasnip.loaders.from_vscode").lazy_load {
            paths = { "./snippets/kubernetes" }
         }
      end
   },
   {
      "nvim-neotest/neotest",
      dependencies = {
         "nvim-neotest/neotest-go",
      },
      config = function()
         require("neotest").setup {
            adapters = {
               require("neotest-go")
            }
         }
      end
   },
   {
      "kvrohit/rasmus.nvim",
      config = function()
         require("rasmus").setup {
            kubeconfig_path = "~/.kube/config",
            context_priority = {
               ["prod-.*"] = 0,
               ["dev-.*"] = 1
            }
         }
      end
   },
   {
      "towolf/vim-helm",
      ft = { "helm" },
      init = function()
         -- Set filetype for Helm templates
         vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
            pattern = { "*/templates/*.yaml", "*/templates/*.tpl", "*.yaml.gotmpl" },
            callback = function()
               vim.bo.filetype = "helm"
            end,
         })
      end
   },
   {
      "b0o/schemastore.nvim",
      lazy = true,
      config = function()
         require("lspconfig").yamlls.setup {
            settings = {
               yaml = {
                  schemaStore = {
                     enable = true,
                     url = "https://www.schemastore.org/api/json/catalog.json",
                  },
               },
            },
         }
      end,
   },
}
