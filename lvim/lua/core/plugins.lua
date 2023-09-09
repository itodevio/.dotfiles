lvim.plugins = {
  { "ThePrimeagen/vim-be-good" },
  { "ntpeters/vim-better-whitespace" },
  { "romainl/vim-cool" },
  { "rafamadriz/friendly-snippets" },
  { "APZelos/blamer.nvim" },
  { "prisma/vim-prisma" },
  {
    "neoclide/coc.nvim",
    branch = "release",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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

