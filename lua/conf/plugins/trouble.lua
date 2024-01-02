local wk = require("which-key")

wk.register({
  t = {
    name = "[t]rouble",
    w = {
      function() require("trouble").toggle("workspace_diagnostics") end,
      "Trouble [w]orkspace diagnostics",
    },
    d = {
      function() require("trouble").toggle("document_diagnostics") end,
      "Trouble [d]ocument diagnostics",
    },
    q = {
      function() require("trouble").toggle("quickfix") end,
      "Trouble [q]uickfix list",
    },
    l = {
      function() require("trouble").toggle("loclist") end,
      "Trouble [l]ocation list",
    },
    r = {
      function() require("trouble").toggle("lsp_references") end,
      "Trouble [r]eferences to current token",
    },
    x = {
      function() require("trouble").close() end,
      "Close Trouble"
    }
  }
},
{
  prefix = "<leader>"
})
