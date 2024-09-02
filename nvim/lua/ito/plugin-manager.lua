local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that runs PackerSync whenever this file changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin-manager.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- Color Themes
  use('EdenEast/nightfox.nvim')
  use('folke/tokyonight.nvim')
  use({
    'catppuccin/nvim',
    as = 'catppuccin',
  })

  -- FuzzyFinder for files and content
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }) -- dependency to improve performance
  use({
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} },
  })

  -- Syntax highlighting
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Auto closing
  use('windwp/nvim-autopairs')
  use('windwp/nvim-ts-autotag')

  -- Quick way to change files
  use('theprimeagen/harpoon')

  -- Game to master vim
  use('theprimeagen/vim-be-good')

  -- Display vim's undo tree
  use('mbbill/undotree')

  -- Git integrations on vim
  use('tpope/vim-fugitive')

  -- Adds a surrounding handling (, [, ', " etc.
  -- Examples: `ysiw"` -> surrounds word with ""; `cs"'` -> replace surrounding "" with ''; `cst"` -> replace surrounding html tag with ""
  use('tpope/vim-surround')

  -- Easy commenting with `gcc`
  use('numToStr/Comment.nvim')

  -- Navigate between tmux and vim with vim ctrl + motions
  use('christoomey/vim-tmux-navigator')

  -- Allows to maximize a vim window
  use('szw/vim-maximizer')

  -- File explorer
  use('nvim-tree/nvim-tree.lua')

  -- File icons on tree
  use('kyazdani42/nvim-web-devicons')

  -- Status line
  use('nvim-lualine/lualine.nvim')

  -- Git signs 
  use('lewis6991/gitsigns.nvim')

  -- Copilot
  use('zbirenbaum/copilot.lua')
  use({
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function ()
      require('copilot_cmp').setup()
    end,
  })

  -- LSP
  use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use('neovim/nvim-lspconfig')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')
  use('saadparwaiz1/cmp_luasnip')
  use('onsails/lspkind.nvim')
  use('ray-x/go.nvim')
  use('ray-x/guihua.lua')


  if packer_bootstrap then
    require('packer').sync()
  end
end)
