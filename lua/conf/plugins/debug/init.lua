require("conf.plugins.debug.dap-config")

local dap_configs = {
  "python"
}

for k, v in pairs(dap_configs) do
  require("conf.plugins.dap." .. v)
end