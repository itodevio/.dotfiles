local fzf = require('fzf-lua')

fzf.setup({
  fzf_opts = {
    ['--layout'] = 'reverse-list',
    ['--prompt'] = 'Files> ',
  }
})

vim.keymap.set('n', '<leader>ff', function() fzf.files({ cwd_prompt = false }) end, {})
vim.keymap.set('n', '<C-p>', function() fzf.files({ cwd_prompt = false }) end, {})
vim.keymap.set('n', '<leader>fs', fzf.live_grep, {})
vim.keymap.set('n', '<C-f>', fzf.live_grep, {})
vim.keymap.set('n', '<F1>', fzf.help_tags, {})
vim.keymap.set({'n', 'i'}, '<M-ESC>', fzf.lsp_code_actions, {})
vim.keymap.set('n', '<leader>ca', fzf.lsp_code_actions, {})
vim.keymap.set('n', '<leader>ic', fzf.lsp_incoming_calls, {})
vim.keymap.set('n', '<leader>.', fzf.diagnostics_document, {})
vim.keymap.set('n', '<leader>..', fzf.diagnostics_workspace, {})
