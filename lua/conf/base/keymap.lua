local wk = require("which-key")

wk.register({
  name = "System",
  e = {
    vim.cmd.Ex, "File [e]xplorer"
  },
  y = {
    [["+y]], "[y]ank to system clipboard",
    mode = {"n", "v"}
  },
  Y = {
    [["+Y]], "[Y]ank line to system clipboard"
  },
  p = {
    [["_dP]], "[p]aste preserving yank buffer",
    mode = "x"
  },
  ["<leader>"] = {
    vim.cmd.source, "Source current file"
  }
},
{
  prefix = "<leader>"
})

-- Which-key doesn't work on non-auto-submitting commands
vim.keymap.set("n", "<leader>r",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "[r]ename symbol" })
