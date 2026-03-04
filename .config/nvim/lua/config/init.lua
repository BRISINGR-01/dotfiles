-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.shiftround = true

vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = "line"
vim.opt.incsearch = true
vim.opt.scrolloff = 8


vim.opt.confirm = true
vim.opt.termguicolors = true
vim.cmd.colorscheme "tokyonight"

vim.opt.whichwrap = "b,s,<,>,[,],h,l"
vim.api.nvim_set_option("clipboard", "unnamedplus")

require 'config/mappings'
require 'config/statusline'
require 'config/lsp'


local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

local path_actions = require('telescope_insert_path')

require('telescope').setup {
  defaults = {
    mappings = {
      n = {
        -- E.g. Type `[i`, `[I`, `[a`, `[A`, `[o`, `[O` to insert relative path and select the path in visual mode.
        -- Other mappings work the same way with a different prefix.
        ["["] = path_actions.insert_reltobufpath_visual,
        ["]"] = path_actions.insert_abspath_visual,
        ["{"] = path_actions.insert_reltobufpath_insert,
        ["}"] = path_actions.insert_abspath_insert,
        ["-"] = path_actions.insert_reltobufpath_normal,
        ["="] = path_actions.insert_abspath_normal,
        -- If you want to get relative path that is relative to the cwd, use
        -- `relpath` instead of `reltobufpath`
        -- You can skip the location postfix if you specify that in the function name.
        -- ["<C-o>"] = path_actions.insert_relpath_o_visual,
      }
    }
  }
}
