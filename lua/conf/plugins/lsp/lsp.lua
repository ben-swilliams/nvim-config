-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local wk = require("which-key")
wk.register({
    c = {
      name = "[c]ode",
      d = {
        vim.diagnostic.open_float,
        "Open [d]iagnositcs"
      },
      l = {
        vim.diagnostic.setloclist,
        "Set [l]ocation list to diagnostics"
      }
    }
  },
  {
    prefix = "<leader>"
  })

wk.register({
  ["["] = {
    name = "Previous",
    d = {
      vim.diagnostic.goto_prev,
      "Previous diagnostic"
    }
  },
  ["]"] = {
    name = "Next",
    d = {
      vim.diagnostic.goto_next,
      "Next diagnostic"
    }
  }
})

local builtin = require("telescope.builtin")
local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
  opts.buffer = bufnr

  wk.register({
      name = "[g]o to",
      D = {
        vim.lsp.buf.declaration,
        "Go to [D]eclaration",
        opts
      },
      d = {
        vim.lsp.buf.definition,
        "Go to [d]efinition",
        opts
      },
      i = {
        vim.lsp.buf.implementation,
        "Go to [i]mplementation",
        opts
      },
      t = {
        vim.lsp.buf.type_definition,
        "Go to [t]ype definition",
        opts
      },
      r = {
        function()
          builtin.lsp_references(require("telescope.themes").get_cursor({}))
        end,
        "List [r]eferences",
        opts
      }
    },
    {
      prefix = "g"
    })

  wk.register({
      c = {
        name = "[c]ode",
        a = {
          {
            vim.lsp.buf.code_action,
            "Code [a]ction",
            opts
          },
          {
            vim.lsp.buf.range_code_action,
            "Range code [a]ction",
            mode = { "v" },
            opts
          }
        },
        f = {
          function()
            vim.lsp.buf.format { async = true }
          end,
          "Code [f]ormat",
          opts,
          mode = { "n", "v" }
        },
        r = {
          vim.lsp.buf.rename,
          "Code smart [r]ename",
          opts
        }
      }
    },
    {
      prefix = "<leader>",
    }
  )

  wk.register({
    K = {
      vim.lsp.buf.hover,
      "Show token info in hover window",
      opts
    }
  })

  wk.register({
      t = {
        name = "[t]rouble",
        r = {
          function() require("trouble").toggle("lsp_references") end,
          "Trouble [r]eferences to current token",
          opts
        },
      }
    },
    {
      prefix = "<leader>"
    })

  wk.register({
    f = {
      name = "[f]ind",
      d = {
        builtin.diagnostics,
        "Find [d]iagnostic",
        opts
      },
      t = {
        builtin.lsp_document_symbols,
        "Find [t]oken",
        opts
      },
      T = {
        builtin.lsp_dynamic_workspace_symbols,
        "Find workspace [T]oken",
        opts
      },
    }
  },
  {
    prefix = "<leader>",
  })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  capabilities = capabilities,
  on_attach = on_attach
}
