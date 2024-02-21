return {
 {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'stevearc/dressing.nvim', -- fancier built-in nvim panels like select,line... ex: rename prompt
    opts = {},
  },
  {
    "xiyaowong/transparent.nvim",
    opts = {
      groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
        'EndOfBuffer',
      },
      extra_groups = {
        'NormalFloat',
        'FloatBorder',
        'NvimTreeWinSeparator',
        'NvimTreeNormal',
        'NvimTreeNormalNC',
        'TroubleNormal',
        'TelescopeNormal',
        'TelescopeBorder',
        'WhichKeyFloat',
      }, -- table: additional groups that should be cleared
      exclude_groups = {}, -- table: groups you don't want to clear
    },
  },
  {
   'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      {'MunifTanjim/nui.nvim'}
    },
    opts = {
      cmdline = {
        prompt = '   ',
      }
    }
  }
}
