return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  dependencies = { "mason.nvim" },
  opts = {
    formatters = {
      biome = {
        require_cwd = true,
      },
    },
    formatters_by_ft = {
      javascript = { "biome", "eslint", "deno_fmt", "ts_ls", stop_after_first = true },
      typescript = { "biome", "eslint", "deno_fmt", "ts_ls", stop_after_first = true },
      javascriptreact = { "biome", "eslint", "deno_fmt", "ts_ls", stop_after_first = true },
      typescriptreact = { "biome", "eslint", "deno_fmt", "ts_ls", stop_after_first = true },
      json = { "biome", "eslint", "deno_fmt", "ts_ls", stop_after_first = true },
      jsonc = { "biome", "eslint", "deno_fmt", "ts_ls", stop_after_first = true },
      go = { "gopls", "gofmt" },
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 1500,
    },
  }
}
