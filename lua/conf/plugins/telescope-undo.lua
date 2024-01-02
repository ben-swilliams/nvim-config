local ts = require("telescope")
require("telescope").setup {
    extensions = {
      undo = {
        side_by_side = true,
        mappings = {
          i = {
            ["<cr>"] = function(bufnr)
              return require("telescope-undo.actions").restore(bufnr)
            end,
            ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
            ["<C-cr>"] = require("telescope-undo.actions").yank_additions,
          },
        }
      }
    }
}

ts.load_extension("undo")

local wk = require("which-key")
wk.register({
  f = {
    name = "[f]ind",
    u = {
      ts.extensions.undo.undo,
      "Find in [u]ndo history"
    }
  }
},
{
  prefix = "<leader>"
})
