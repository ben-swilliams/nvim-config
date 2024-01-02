local lua_ls_setup = {
  Lua = {
    runtime = {
      -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      version = "LuaJIT",
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { "vim" },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file("", true),
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
      enable = false,
    },
  },
}

local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})
lspconfig.lua_ls.setup({ settings = lua_ls_setup })

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

-- Diagnostic navigation
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
  { desc = "Go to previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
  { desc = "Go to next diagnostic" })

  -- Which-key doesn't work on non-auto-submitting commands
  vim.keymap.set("n", "<leader>cr",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "[r]ename symbol" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    local builtin = require("telescope.builtin")

    wk.register({
        name = "[g]o to in file",
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
            vim.lsp.buf.code_action,
            "Code [a]ction",
            opts
          },
          f = {
            function()
              vim.lsp.buf.format { async = true }
            end,
            "Code [f]ormat"
          }
        }
      },
      {
        prefix = "<leader>",
        mode = { "n", "v" }
      }
    )

    wk.register({
      K = {
        vim.lsp.buf.hover,
        "Show token info in hover window",
        opts
      }
    })

  end,
})
