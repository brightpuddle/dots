return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false,
    },
    inlay_hints = {
      enabled = false,
    },
    servers = {
      yamlls = {
        settings = {
          yaml = {
            customTags = {
              "!override sequence",
              "!reset sequence",
              "!env",
            },
          },
        },
      },
      ocamllsp = {
        mason = false,
      },
    },
  },
}
