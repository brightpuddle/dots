vim.g.colors_name = "zenlocal"

package.loaded["zenlocal"] = nil

-- include our theme file and pass it to lush to apply
require("lush")(require("zenlocal"))
