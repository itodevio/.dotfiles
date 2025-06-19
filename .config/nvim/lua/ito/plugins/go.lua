return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    event = { "CmdlineEnter" },
  },
}
-- Absurdly usefull commands to run:
-- :GoAddTag -> Add a tag to the struct {json,xml,yaml,sql}
-- :GoIfErr -> Add if err != nil { return }
