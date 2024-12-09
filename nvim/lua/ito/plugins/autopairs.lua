-- Auto close brackets and tags
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
    }
  },
  { "windwp/nvim-ts-autotag" },
}
