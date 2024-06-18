local wk = require("which-key")

wk.register({
  name = "System",
  y = {
    [["+y]], "[y]ank to system clipboard",
    mode = {"n", "v"}
  },
  Y = {
    [["+Y]], "[Y]ank line to system clipboard"
  },
  p = {
    [["_dP]], "[p]aste preserving yank buffer",
    mode = "v"
  },
  ["<leader>"] = {
    vim.cmd.source, "Source current file"
  }
},
{
  prefix = "<leader>"
})

wk.register({
  J = {
    [[:m '>+1<CR>gv=gv]], "Move line down",
    mode = "v"
  },
  K = {
    [[:m '<-2<CR>gv=gv]], "Move line up",
    mode = "v"
  }
})

wk.register({
  ["C-u"] = {
    [[<C-u>zz]], "Go up half a page"
  },
  ["C-d"] = {
    [[<C-d>zz]], "Go down half a page"
  }
})

-- Which-key doesn't work on non-auto-submitting commands
vim.keymap.set("n", "<leader>r",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "[r]ename symbol" })
