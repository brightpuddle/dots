vim.g.colors_name = "nord"

package.loaded["nord"] = nil

-- include our theme file and pass it to lush to apply
require("lush")(require("nord"))
