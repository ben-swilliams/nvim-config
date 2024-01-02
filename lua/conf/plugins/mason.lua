require("mason").setup()
require("mason-lspconfig").setup()

local wk = require("which-key")

wk.register({
    name = "[o]pen",
    o = {
      m = {
        "<cmd>Mason<cr>",
        "[m]ason LSP servers"
      }
    }
  },
  {
    prefix = "<leader>"
  }
)
