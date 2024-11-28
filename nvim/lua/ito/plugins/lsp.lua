local root_pattern = require('lspconfig/util').root_pattern

local function shouldFormat(event)
  if root_pattern(
    -- Biome Projects
    "biome.json",
    "biome.jsonc",

    -- Deno Projects
    "deno.json",
    "deno.jsonc"
  )(vim.fn.fnamemodify(event.match, ':p')) then
    return true
  end

  return false
end

-- Lsp_attach is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP keybindings',
  callback = function(event)
    local opts = { buffer = event.buf }

    -- Go to definition
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    -- Go to declaration
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    -- Hover over the word
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    -- Opens the search for symbol inside workspace
    vim.keymap.set('n', '<leader>ws', function() vim.lsp.buf.workspace_symbol() end, opts)
    -- Opens diagnostic in a float windows
    vim.keymap.set('n', '<leader>xd', function() vim.diagnostic.open_float() end, opts)
    -- Go next and prev in suggestions
    vim.keymap.set('n', '[d', function() vim.lsp.buf.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.lsp.buf.goto_prev() end, opts)

    -- Open code actions
    vim.keymap.set('n', '<leader>lca', function() vim.lsp.buf.code_action() end, opts)
    -- Open references
    vim.keymap.set('n', '<leader>rr', function() vim.lsp.buf.references() end, opts)
    -- Rename source
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    -- Open signature help
    --vim.keymap.set('n', '<leader>+', function() vim.lsp.buf.signature_help() end, opts)

    -- autoformat on save for go files
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = event.buf,
      callback = function()
        local ft = vim.bo.filetype

        if ft == 'go' then
          require("go.format").gofmt()
          require("go.format").goimports()
        end

        if shouldFormat(event) then
          vim.lsp.buf.format()
        end
      end
    })
  end
})

vim.diagnostic.config({
  virtual_text = {
    source = true
  },
  signs = true,
  float = {
    header = 'Diagnostics',
    source = true,
    border = 'rounded',
  },
})
