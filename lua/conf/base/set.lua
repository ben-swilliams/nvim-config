-- LINE NUMBERS
-- Basic numbers
vim.opt.number = true
-- Relative numbering
vim.opt.relativenumber = true

-- Sets the colour of column 80 as a 'long line' marker
vim.opt.colorcolumn = "80"

-- Stops text wrapping over lines (I hate that)
vim.opt.wrap = false

-- INDENTATION
-- Do it automatically
vim.opt.autoindent = true
-- Contextual indentation
vim.opt.smartindent = true
-- Replace tabs with spaces
vim.opt.expandtab = true
-- Indents are 2 spaces
vim.opt.shiftwidth = 2
-- Tabs are 2 spaces 
vim.opt.tabstop = 2

-- Persistent undo
vim.opt.undofile = true

-- SEARCHING
-- Don't keep things highlighted
vim.opt.hlsearch = false
-- Incremental search is cool
vim.opt.incsearch = true

-- BUFFER SPLITS
-- Split on right vertically by default
vim.opt.splitright = true
-- Split below horizontally by default
vim.opt.splitbelow = true
