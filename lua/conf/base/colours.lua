-- I wanna SEE the line numbers
require("tokyonight").setup {
  style = "storm",
  on_colors = function(colors)
    colors.fg_gutter = colors.yellow
  end
}

vim.cmd[[colorscheme tokyonight]]
