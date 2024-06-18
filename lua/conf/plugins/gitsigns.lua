local gs = require("gitsigns")
local wk = require("which-key")

gs.setup({
  sign_priority = 0,
  on_attach = function(bufnr)
    wk.register({
      g = {
        name = "[g]it",
        S = {
          gs.stage_buffer,
          "[S]tage current buffer"
        },
        R = {
          gs.reset_buffer,
          "[R]eset buffer"
        },
        B = {
          gs.toggle_current_line_blame,
          "Toggle [b]lame of line"
        },
        D = {
          gs.diffthis('~'),
          "[D]iff file"
        },
        h = {
          name = "[h]unk",
          s = {
            gs.stage_hunk,
            "[s]tage current hunk"
          },
          r = {
            gs.reset_hunk,
            "[r]eset hunk"
          },
          u = {
            gs.undo_stage_hunk,
            "[u]ndo stage hunk"
          },
          p = {
            gs.preview_hunk,
            "[p]review hunk"
          },
          b = {
            function() gs.blame_line{full=true} end,
            "See [b]lame of line"
          },
          d = {
            gs.diffthis,
            "[d]iff this"
          }
        },
      },
      prefix = "<leader>"
    })

    wk.register({
     ["["] = {
       name = "Previous",
       h = {
         function() gs.nav_hunk('prev') end,
         "Previous [h]unk"
       }
     },
     ["]"] = {
       name = "Next",
       h = {
         function() gs.nav_hunk('next') end,
         "Next [h]unk"
       }
     }
    })
  end
})
