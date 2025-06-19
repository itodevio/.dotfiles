return {
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "williamboman/mason.nvim" },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()

      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local util = require("lspconfig/util")

      -- Biome setup
      lspconfig.biome.setup({})

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "denols",
          "ts_ls",
          "biome",
          "html",
          "cssls",
          "tailwindcss",
          "emmet_ls",
        },
        handlers = {
          function(server)
            lspconfig[server].setup({
              capabilities = lsp_capabilities,
            })
          end,

          lua_ls = function()
            lspconfig.lua_ls.setup({
              capabilities = lsp_capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  }
                }
              }
            })
          end,

          gopls = function()
            lspconfig.gopls.setup({
              capabilities = lsp_capabilities,
              cmd = { "gopls" },
              filetypes = { "go", "gomod", "gowork", "gotmpl" },
              root_dir = util.root_pattern("go.work", "go.mod", ".git"),
              settings = {
                gopls = {
                  completeUnimported = true,
                  usePlaceholders = true,
                  analyses = {
                    unusedparams = true,
                    unusedresult = true,
                  },
                },
              },
            })
          end,

          ts_ls = function()
            lspconfig.ts_ls.setup({
              capabilities = lsp_capabilities,
              root_dir = util.root_pattern("package.json"),
              single_file_support = false,
            })
          end,

          denols = function()
            lspconfig.denols.setup({
              capabilities = lsp_capabilities,
              root_dir = util.root_pattern("deno.json", "deno.jsonc"),
            })
          end,

          biome = function()
            lspconfig.biome.setup({
              capabilities = lsp_capabilities,
              root_dir = util.root_pattern("biome.json", "biome.jsonc"),
            })
          end,

          emmet_ls = function()
            lspconfig.emmet_ls.setup({
              capabilities = lsp_capabilities,
            })
          end,
        },
      })
    end,
  },
}
