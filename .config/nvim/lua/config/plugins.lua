local plugins = {
  -- {
  --   'charludo/projectmgr.nvim',
  --   lazy = false, -- important!
  -- },
  -- {
  --   "AckslD/nvim-neoclip.lua",
  --   requires = {
  --     {'nvim-telescope/telescope.nvim'},
  --   },
  --   config = function()
  --     require('neoclip').setup()
  --   end,
  --   lazy = false
  -- },
  -- {
  --   'ThePrimeagen/harpoon',
  --   requires = {
  --     {'nvim-lua/plenary.nvim'}
  --   }
  -- },
  {
    "nvim-tree/nvim-tree.lua"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- set termguicolors to enable highlight groups
      vim.opt.termguicolors = true

      -- OR setup with some options
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      })
    end
  },
  {
   'sudormrfbin/cheatsheet.nvim',
    requires = {
     {'nvim-telescope/telescope.nvim'},
     {'nvim-lua/popup.nvim'},
     {'nvim-lua/plenary.nvim'},
    }
  }
}

return plugins
