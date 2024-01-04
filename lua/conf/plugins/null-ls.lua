require("null-ls").setup {}

local wk = require("which-key")
wk.register({
  o = {
    name = "[o]pen",
    n = {
      vim.cmd.NullLsInfo,
      "Open [n]ull-ls information"
    }
  }
},
{
  prefix = "<leader>"
})
