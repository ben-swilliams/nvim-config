require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright"
  },
  automatic_installation = true
})

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
