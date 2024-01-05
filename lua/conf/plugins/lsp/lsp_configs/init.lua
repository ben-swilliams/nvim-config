local configs = {
  "clangd",
  "lua_ls",
  "marksman",
  "pyright",
}

for k, v in pairs(configs) do
  require("conf.plugins.lsp.lsp_configs." .. v)
end
