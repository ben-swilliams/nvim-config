local tree = require("nvim-tree.api")
local wk = require("which-key")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }

	-- default mappings
	tree.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	wk.register({
		e = {
			vim.cmd.NvimTreeFocus,
			"[e]xplore in nvim tree",
			opts,
		},
	}, {
		prefix = " ",
	})
end

-- pass to setup along with your other options
require("nvim-tree").setup({
  hijack_cursor = true,
	on_attach = my_on_attach,
  view = {
    centralize_selection = true,
  },
  renderer = {
    highlight_git = true,
    highlight_diagnostics = true,
    highlight_opened_files = "icon",
    highlight_modified = "name",
    indent_markers = {
      enable = true
    },
    icons = {
      git_placement = "signcolumn",
      diagnostics_placement = "signcolumn"
    }
  },
  diagnostics = {
    enable = true,
    severity = {
      min = vim.diagnostic.severity.WARN,
    }
  },
  modified = {
    enable = true,
  }
})
