return {
  {
    'charludo/projectmgr.nvim',
    lazy = false, -- important!
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
    -- tag = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
	  ["core.integrations.treesitter"] = {},
	  ["core.export.markdown"] = {},
	  ["core.export"] = {},
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  }
}
