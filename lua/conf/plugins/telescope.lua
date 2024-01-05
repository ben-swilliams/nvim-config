require("telescope").setup()
require('telescope').load_extension('fzf')

local wk = require("which-key")
local builtin = require("telescope.builtin")

wk.register({
  f = {
    name = "[f]ind",
    f = {
      builtin.find_files,
      "Find [f]ile"
    },
    s = {
      builtin.live_grep,
      "Find [s]tring"
    },
    S = {
      function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end,
      "Find [s]tring (static)"
    },
    r = {
      builtin.grep_string,
      "Find [r]eferences"
    },
    o = {
      builtin.oldfiles,
      "[o]ld files"
    },
    b = {
      builtin.buffers,
      "Find [b]uffer"
    }
  },
},
{
  prefix = "<leader>"
})

-- Open telescope results in trouble

local trouble = require("trouble.providers.telescope")
local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<c-t>"] = trouble.open_with_trouble,
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next -- move to next result
      },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}
