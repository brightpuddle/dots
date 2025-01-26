return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      gohtmltmpl = { "djlint", "rustywind" },
      javascript = { "biome", "rustywind" },
      typescript = { "biome", "rustywind" },
      typescriptreact = { "biome", "rustywind" },
      javascriptreact = { "biome", "rustywind" },
      json = { "jq" },
      ocaml = { "ocamlfmt" },
      -- markdown = {},
      -- python = { "isort", "ruff_fix", "ruff_format" },
      -- rust = {},
      sh = { "shfmt" },
      swift = { "swiftlint" },
      templ = { "templ", "rustywind" },
      -- toml = { "taplo" },
      -- xml = { "xmllint" },
      v = { "blah" },
      -- yaml = { "yamlfmt" },
    },
  },
}
