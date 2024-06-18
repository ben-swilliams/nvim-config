local gb_colors = require("gruvbox").palette
require("gruvbox").setup {
  overrides = {
    LineNr = { fg = gb_colors.bright_yellow, bold = true },
    SignColumn = { bg = "#282828" },
    GruvboxRedSign = { bg = "#282828" },
    GruvboxYellowSign = { bg = "#282828" },
    GruvboxPurpleSign = { bg = "#282828" },
    GruvboxAquaSign = { bg = "#282828" },
    GruvboxGreenSign = { bg = "#282828" },
    GruvboxBlueSign = { bg = "#282828" },
    GruvboxOrangeSign = { bg = "#282828" },
  }
}

vim.cmd[[colorscheme gruvbox]]
