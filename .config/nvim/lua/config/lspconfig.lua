-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
return function()
  -- Sign column icons
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local lsp_format = require("lsp-format")
  lsp_format.setup()

  -- Buffer attach function
  local function on_attach(cfg)
    cfg = cfg or {}
    cfg.format = cfg.format or false
    return function(client, bufnr)
      if cfg.format then
        lsp_format.on_attach(client, bufnr)
      end
      local k = vim.keymap
      client.resolved_capabilities.document_formatting = cfg.format
      client.resolved_capabilities.document_range_formatting = cfg.format
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      k.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
      k.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
      k.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
      k.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
    end
  end

  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  local lsp = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local function config(cfg)
    return {
      on_attach = on_attach(cfg),
      capabilities = capabilities,
    }
  end

  lsp.pyright.setup(config())
  lsp.rust_analyzer.setup(config())
  lsp.tsserver.setup(config())
  lsp.gopls.setup(config())
  lsp.html.setup(config())
  lsp.jsonls.setup(config())
  lsp.cssls.setup(config())
  -- lsp.eslint.setup(config())
  lsp.sumneko_lua.setup({
    on_attach = on_attach({ format = true }),
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  })

  null_ls.setup({
    on_attach = on_attach({ format = true }),
    sources = {
      -- Diagnostics
      diagnostics.flake8,
      diagnostics.revive,
      diagnostics.eslint_d,

      -- Code Actions

      -- Formatting
      formatting.black,
      formatting.fixjson,
      formatting.golines,
      formatting.isort,
      formatting.prettierd.with({
        disabled_filetypes = {
          -- "javascript",
          -- "typescript",
          "json",
        },
      }),
      -- formatting.rome,
      formatting.rustfmt,
      formatting.shfmt,
      -- formatting.stylua,
      formatting.trim_newlines,
      formatting.trim_whitespace,
      formatting.xmllint,
    },
  })
end
