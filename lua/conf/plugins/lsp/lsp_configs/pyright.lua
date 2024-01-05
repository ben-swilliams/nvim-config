local lsp_config = require("conf.plugins.lsp.lsp")

local on_attach = lsp_config.on_attach
local capabilities = lsp_config.capabilities

require("lspconfig")["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})
