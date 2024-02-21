local plugins = {
  {
    "neovim/nvim-lspconfig",
    cofig = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    'charludo/projectmgr.nvim',
    lazy = false, -- important!
  },
  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('neoclip').setup()
    end,
    lazy = false
  },
  {
    {'nvim-lua/plenary.nvim'},
    'ThePrimeagen/harpoon',
    requires = {
    }
  }
}

return plugins
