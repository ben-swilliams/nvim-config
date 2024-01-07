local tree = require("nvim-tree.api")
local wk = require("which-key")
vim.g.loaded_netrw = 1

local function my_on_attach(bufnr)

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	tree.config.mappings.default_on_attach(bufnr)

	-- custom mappings
  wk.register({
    e = {
      vim.cmd.NvimTreeOpen,
      "[e]xplore in nvim tree"
    }
  },
  {
    prefix = " "
  })
end

-- pass to setup along with your other options
require("nvim-tree").setup({
	---
	on_attach = my_on_attach,
	---
})
