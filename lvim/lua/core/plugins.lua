lvim.plugins = {
  { "ThePrimeagen/vim-be-good" },
  { "ntpeters/vim-better-whitespace" },
  { "romainl/vim-cool" },
  { "rafamadriz/friendly-snippets" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "abecodes/tabout.nvim",
    config = function()
      require("tabout").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}

