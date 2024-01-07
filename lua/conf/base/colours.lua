-- I wanna SEE the line numbers
require("tokyonight").setup {
  style = "storm",
  on_colors = function(colors)
    colors.fg_gutter = colors.yellow
  end
}

local gb_colors = require("gruvbox").palette
require("gruvbox").setup {
  overrides = {
    LineNr = { fg = gb_colors.bright_yellow, bold = true }
  }
}

vim.cmd[[colorscheme gruvbox]]
