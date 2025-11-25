return {
  { 'mason-org/mason.nvim', opts = {} },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#html
      ensure_installed = {
        'ts_ls',
        'jsonls',
        'tailwindcss',
        'css_variables',

        'lua_ls',
        'pyright',

        'rust_analyzer',
        'gopls',
        'clangd',
        'cmake',

        'harper_ls',
        'biome',
        'yamlls',
        'taplo',
        'bashls',
        'docker_language_server',
        'docker_compose_language_service',
      },
      automatic_enable = {
        exclude = {
          'harper_ls',
        },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',

    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local lspconfig_defaults = require('lspconfig').util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities,
        require('blink.cmp').get_lsp_capabilities()
      )
      vim.lsp.config('harper_ls', {
        cmd = { 'harper-ls', '--stdio' },
        filetypes = { 'markdown' },
        root_markers = { '.git' },
      })
    end,
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = 'default',
        ['<C-B>'] = { function(cmp)
          if cmp.is_documentation_visible() then
            cmp.hide_documentation()
          else
            cmp.show_documentation()
          end
        end },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-X>'] = { 'show', 'fallback' },
        ['<Esc>'] = { 'cancel', 'fallback' },
        ['<C-Down>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-Up>'] = { 'scroll_documentation_up', 'fallback' },

        ['1'] = { function(cmp) cmp.accept({ index = 1 }) end },
        ['<C-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
        ['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
        ['<C-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
        ['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
        ['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
        ['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
        ['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
        ['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
        ['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
      },

      appearance = {
        nerd_font_variant = 'normal' -- 'mono', 'normal'
      },

      completion = {
        keyword = { range = 'prefix' },
        ghost_text = {
          enabled = true
        },
        menu = {
          border = 'rounded',
          scrollbar = false,
          draw = {
            columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
            components = {
              item_idx = {
                text = function(ctx) return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx) end,
                highlight = 'BlinkCmpItemIdx' -- optional, only if you want to change its color
              }
            }
          }
        },
        documentation = {
          auto_show = false,
          window = { border = 'rounded' }
        },
      },
      signature = {
        enabled = true,
      },

      sources = {
        default = { 'buffer', 'path', 'lsp', 'snippets' },
      },

      fuzzy = {
        use_proximity = true,
        implementation = "prefer_rust_with_warning",
        sorts = {
          'exact',
          function(a, b)
            if a.client_name == b.client_name then
              if a.source_id == 'snippets' then
                return
              end
              if (b.source_id == 'snippets') then
                return
              end
            end

            print((a.source_id))


            -- print(vim.inspect(a))
            if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
              return
            end
            return b.client_name == 'emmet_ls'
          end,
          'score',
          'sort_text',
          'label',
        }
      }
    },
    opts_extend = { "sources.default" }
  }

}
