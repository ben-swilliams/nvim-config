local wk = require("which-key")
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.pylint.with({
      diagnostic_config = {
        virtual_text = {
          severity = {
            min = vim.diagnostic.severity.WARN,
          },
        },
      },
    }),
  },
})

wk.register({
  o = {
    name = "[o]pen",
    n = {
      vim.cmd.NullLsInfo,
      "Open [n]ull ls info",
    },
  },
}, {
  prefix = "<leader>",
})
