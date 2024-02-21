local M = {}

--M.disabled = {

--}

M.projectmgr = {
  n = {
    ["<leader>p"] = {":ProjectMgr<CR>", "Open project manager"}
  }
}

M.neoclip = {
  n = {
   ["<leader>c"] = {":Telescope neoclip <CR>", "Open clipboard history"}
  }
}

M.telescope = {
  n = {
    ["<leader>fs"] = {
      function()
         require('telescope').extensions.live_grep_args.live_grep_args()
      end,
      "Quick search"
    }
  }
}

return M
