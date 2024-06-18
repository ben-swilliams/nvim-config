local gb_colors = require("gruvbox").palette
require("gruvbox").setup {
  overrides = {
    LineNr = { fg = gb_colors.bright_yellow, bold = true }
  }
}

vim.cmd[[colorscheme gruvbox]]
