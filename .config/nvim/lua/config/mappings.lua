local utils = require('utils')
local bind = vim.keymap.set

bind("n", "<leader>r", ":source $HOME/.config/nvim/init.lua <CR>")
bind("n", "q", ":q! <CR>", {silent = true})
bind("n", "Q", ":qa! <CR>", {silent = true})
bind("n", "", ":w <CR>", {silent = true})
bind("i", "", ":w <CR>", {silent = true})

bind("n", "<F4>", utils.suspend_suhutdown, { silent = true })
bind("n", "<C-Right>", ":vertical resize -1 <CR>", { silent = true })
bind("n", "<C-Left>", ":vertical resize +1 <CR>", { silent = true })
bind("n", "<C-Up>", ":resize -1 <CR>", { silent = true })
bind("n", "<C-Down>", ":resize +1 <CR>", { silent = true })

----------------------Plugins--------------------------------------------------------
bind('n', "<C-t>", ":TransparentToggle <CR>", { silent = true, desc = "Make backgrounid transparent" })

bind("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", { silent = true, desc = "Toggle nvimtree" })
bind("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", { silent = true, desc = "Focus nvimtree" })
bind("n", "<leader>p", ":ProjectMgr <CR>", { silent = true, desc = "Open Project manager" })
bind("n", "<leader>c", ":FineCmdline <CR>", { silent = true, desc = "Open `Fine` Command line" })
bind("n", "<leader>l", ":Lazy <CR>", { silent = true, desc = "Open Lazy Manager" })
