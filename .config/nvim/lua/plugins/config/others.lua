return {
  {
    'petertriho/nvim-scrollbar',
    init = function()
      require("scrollbar").setup()
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
      require("scrollbar.handlers.gitsigns").setup()
    end
  },
  'nvim-lua/plenary.nvim',
  'nvim-treesitter/nvim-treesitter',
  {
    "mbbill/undotree",
    init = function()
      -- Enable persistent undo if supported
      if vim.fn.has("persistent_undo") == 1 then
        local target_path = vim.fn.expand("~/.undodir")

        -- Create the directory if it doesn't exist
        if vim.fn.isdirectory(target_path) == 0 then
          vim.fn.mkdir(target_path, "p")
        end

        vim.opt.undodir = target_path
        vim.opt.undofile = true
      end
    end,
    keys = {
      {
        "<leader>u",
        "<cmd>UndotreeToggle<cr>",
        desc = "Open undo tree",
      },
    }
  },

}
