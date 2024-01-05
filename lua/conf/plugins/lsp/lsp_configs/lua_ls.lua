local lsp_config = require("conf.plugins.lsp.lsp")

local on_attach = lsp_config.on_attach
local capabilities = lsp_config.capabilities

require("lspconfig")["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true
        }
      }
    }
  }
})
