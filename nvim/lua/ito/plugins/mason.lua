local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local util = require('lspconfig/util')

-- Adding Deno support to ts files
vim.g.markdown_fenced_languages = {
"ts=typescript"
}
lspconfig.denols.setup{}

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'eslint',
    'gopls',
    'denols',
    'html',
    'cssls',
    'tailwindcss',
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
              globals = { 'vim' },
            }
          }
        }
      })
    end,

    gopls = function()
      lspconfig.gopls.setup({
        capabilities = lsp_capabilities,
        cmd = {"gopls"},
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
  },
})
