require("telescope").setup()
require('telescope').load_extension('fzf')

local wk = require("which-key")
local builtin = require("telescope.builtin")

wk.register({
  f = {
    name = "[f]ind",
    f = {
      function() builtin.find_files() end,
      "Find [f]ile"
    },
    s = {
      function() builtin.live_grep() end,
      "Find [s]tring"
    },
    S = {
      function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end,
      "Find [s]tring (static)"
    },
    r = {
      function() builtin.grep_string() end,
      "Find [r]eferences"
    },
    o = {
      function() builtin.oldfiles() end,
      "[o]ld files"
    }
  },
},
{
  prefix = "<leader>"
})

-- Open telescope results in trouble

local trouble = require("trouble.providers.telescope")
require("telescope").setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}
