return {
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency to improve performance
  {
	  "nvim-telescope/telescope.nvim", tag = "0.1.8",
	  requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
}
