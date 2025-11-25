require("blink.cmp").setup {
  completion = {
    menu = {
      draw = {
        components = {
          -- customize the drawing of kind icons
          kind_icon = {
            text = function(ctx)
              -- default kind icon
              local icon = ctx.kind_icon
              -- if LSP source, check for color derived from documentation
              if ctx.item.source_name == "LSP" then
                local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                if color_item and color_item.abbr ~= "" then
                  icon = color_item.abbr
                end
              end
              return icon .. ctx.icon_gap
            end,
            highlight = function(ctx)
              -- default highlight group
              local highlight = "BlinkCmpKind" .. ctx.kind
              -- if LSP source, check for color derived from documentation
              if ctx.item.source_name == "LSP" then
                local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                if color_item and color_item.abbr_hl_group then
                  highlight = color_item.abbr_hl_group
                end
              end
              return highlight
            end,
          },
        },
      },
    },
  },
}

require("nvim-highlight-colors").setup {
  render = 'virtual', -- 'background'|'foreground'|'virtual'
  virtual_symbol = '',
  virtual_symbol_prefix = '',
  virtual_symbol_suffix = ' ',

  ---Set virtual symbol position()
  ---@usage 'inline'|'eol'|'eow'
  ---inline mimics VS Code style
  ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
  ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
  virtual_symbol_position = 'inline',

  enable_hex = true,
  enable_short_hex = true,
  enable_rgb = true,
  enable_var_usage = true,
  enable_named_colors = true,

  enable_hsl = false,
  enable_ansi = false,
  enable_hsl_without_function = false,
  enable_tailwind = false,

  ---Set custom colors
  ---Label must be properly escaped with '%' to adhere to `string.gmatch`
  --- :help string.gmatch
  -- custom_colors = {
  --   { label = '%-%-theme%-primary%-color',   color = '#0f1219' },
  --   { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
  -- },

  -- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
  exclude_filetypes = {},
  exclude_buftypes = {},
  -- Exclude buffer from highlighting e.g. 'exclude_buffer = function(bufnr) return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1000000 end'
  exclude_buffer = function(bufnr) end
}
