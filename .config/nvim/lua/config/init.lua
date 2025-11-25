-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8

vim.opt.termguicolors = true
vim.cmd.colorscheme "tokyonight"

vim.opt.whichwrap = "b,s,<,>,[,],h,l"
vim.api.nvim_set_option("clipboard", "unnamedplus")

require 'config/mappings'
require 'config/statusline'
require 'config/lsp'
