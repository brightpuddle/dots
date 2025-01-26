return {
  {
    "eraserhd/parinfer-rust",
    dependencies = {
      {
        "Olical/conjure",
      },
    },
    build = "cargo build --release",
  },

  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "python" }, -- etc
    lazy = true,
    init = function()
      vim.g["conjure#client#scheme#stdio#command"] = "csi -quiet -:c"
      vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "\n-#;%d-> "
      vim.g["conjure#client#scheme#stdio#value_prefix_pattern"] = false
      -- vim.g["conjure#debug"] = true
    end,

    -- Optional cmp-conjure integration
    dependencies = { "PaterJason/cmp-conjure" },
  },
  {
    "PaterJason/cmp-conjure",
    lazy = true,
    config = function()
      local cmp = require("cmp")
      local config = cmp.get_config()
      table.insert(config.sources, { name = "conjure" })
      return cmp.setup(config)
    end,
  },
}
