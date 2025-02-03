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
   }
}