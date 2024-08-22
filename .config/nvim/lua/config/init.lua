
-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.whichwrap = "b,s,<,>,[,],h,l"
vim.opt.ignorecase = true
vim.cmd.colorscheme  "tokyonight"
vim.api.nvim_set_option("clipboard","unnamedplus")

require 'config/mappings'

