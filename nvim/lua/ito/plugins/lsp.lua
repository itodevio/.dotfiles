local lsp = require('lsp-zero')

-- Lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(_, bufnr)
  local opts = {buffer = bufnr}

  -- Go to definition
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  -- Go to declaration
  vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
  -- Hover over the word
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  -- Opens the search for symbol inside workspace
  vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
  -- Opens diagnostic in a float windows
  vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
  -- Go next and prev in suggestions
  vim.keymap.set('n', '[d', function() vim.lsp.buf.goto_next() end, opts)
  vim.keymap.set('n', ']d', function() vim.lsp.buf.goto_prev() end, opts)

  -- Open code actions
  vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
  -- Open references
  vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
  -- Rename source
  vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
  -- Open signature help
  --vim.keymap.set('n', '<leader>+', function() vim.lsp.buf.signature_help() end, opts)

  -- autoformat on save for go files
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = bufnr,
    callback = function()
      if vim.bo.filetype == 'go' then
        vim.lsp.buf.format({async = true})
      end
    end
  })
end

lsp.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

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
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    lua_ls = function()
      require('lspconfig').lua_ls.setup({
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

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({details = true})
local luasnip = require('luasnip')

-- Load friendly-snippets
require('luasnip/loaders/from_vscode').lazy_load()

vim.opt.completeopt = 'menu,menuone,noselect'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'}, -- text within the buffer
    {name = 'luasnip'}, -- snippets
    {name = 'path'}, -- file system paths
  },
  mapping = cmp.mapping.preset.insert({
    -- confirm completion
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<C-k>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
    ['<C-j>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
    ['<C-Space>'] = cmp.mapping.complete(), -- Show completion suTabggestions
    ['<C-q>'] = cmp.mapping.abort(), -- Close completion window

    -- scroll up and down the documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  formatting = cmp_format,
})
