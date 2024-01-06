local dap = require("dap")
local wk = require("which-key")

wk.register({
  d = {
    name = "[d]ebug",
    c = {
      dap.continue,
      "[c]ontinue running program"
    },
    b = {
      dap.toggle_breakpoint,
      "Toggle [b]reakpoint"
    }
  }
},
{
  prefix = "<leader>"
})

