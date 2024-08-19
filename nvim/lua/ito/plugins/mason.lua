local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'tsserver',
    'eslint',
    'gopls',
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
      require('lspconfig').gopls.setup({
        settings = {
          gopls = {
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      })
    end,
  },
})
