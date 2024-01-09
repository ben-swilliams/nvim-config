local dap = require("dap")
local ui = require("dapui")
local wk = require("which-key")

dap.adapters.python = function(cb, config)
  if config.request == "attach" then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or "127.0.0.1"
    cb({
      type = "server",
      port = assert(port, "`connect.port` is required for a python `attach` configuration"),
      host = host,
      options = {
        source_filetype = "python",
      },
    })
  else
    cb({
      type = "executable",
      command = "/Users/ben/.virtualenvs/debugpy/bin/python",
      args = { "-m", "debugpy.adapter" },
      options = {
        source_filetype = "python",
      },
    })
  end
end

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}", -- This configuration will launch the current file if used.
    console = "integratedTerminal",
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      if vim.fn.executable(os.getenv("CONDA_PREFIX") .. "/bin/python3") == 1 then
        return os.getenv("CONDA_PREFIX") .. "/bin/python3"
      else
        return "/usr/bin/python3"
      end
    end,
  },
}

local configure = function()
  ui.setup({
    layouts = {
      {
        elements = {
          {
            id = "scopes",
            size = 0.5,
          },
          {
            id = "watches",
            size = 0.5,
          },
        },
        size = 40,
        position = "left",
      },
      {
        elements = {
          {
            id = "repl",
            size = 0.5
          },
          {
            id = "console",
            size = 0.5
          },
        },
        size = 10,
        position = "bottom"
      }
    },
  })

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
      }
    },
  }, {
    prefix = "<leader>",
  })
end

M = {}

M.configuration = configure

return M
