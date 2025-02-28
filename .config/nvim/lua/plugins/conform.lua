return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      fish = {},
      go = { "goimports", "gofumpt" },
      gohtmltmpl = { "djlint", "rustywind" },
      javascript = { "biome", "rustywind" },
      javascriptreact = { "biome", "rustywind" },
      json = { "jq" },
      ocaml = { "ocamlformat" },
      python = { "isort", "ruff_fix", "ruff_format" },
      sh = { "shfmt" },
      swift = { "swiftlint" },
      templ = { "templ", "rustywind" },
      typescript = { "biome", "rustywind" },
      typescriptreact = { "biome", "rustywind" },
    },
  },
}
