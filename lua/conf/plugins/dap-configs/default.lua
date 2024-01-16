local dap = require("dap")
local ui = require("dapui")
local wk = require("which-key")

local configure = function()
  wk.register({
    d = {
      name = "[d]ebug",
      c = {
        dap.continue,
        "[c]ontinue running program",
      },
      b = {
        dap.toggle_breakpoint,
        "Toggle [b]reakpoint",
      },
      i = {
        ui.eval,
        "[i]nspect current variable",
      },
      t = {
        ui.toggle,
        "[t]oggle debug elements"
      },
      e = {
        function() ui.eval(vim.fn.input("Evaluate > ")) end,
        "[e]valuate expression"
      },
      x = {
        function() dap.disconnect({ terminateDebuggee = true }) end,
        "E[x]terminate session"
      },
      B = {
        dap.clear_breakpoints,
        "Clears [B]reakpoints"
      }
    },
  }, {
    prefix = "<leader>",
  })
end

M = {}

M.configure = configure

return M
