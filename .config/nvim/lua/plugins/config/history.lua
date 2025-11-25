return {
  'mclean25/nvim-file-history',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    local file_history = require('nvim-file-history')
    local telescope_integration = require('nvim-file-history.telescope')

    file_history.setup({
      max_history_size = 100,
      exclude_patterns = {
        '%.git/',
        'node_modules/',
        '%.cache/',
        '/tmp/',
        '^oil:/', -- Exclude oil.nvim paths
      },
      exclude_filetypes = {
        'help',
        'NvimTree',
        'neo-tree',
        'telescope',
        'lazy',
        'mason',
        'oil',
      }
    })

    -- Keybindings
    vim.keymap.set('n', '<leader>b', telescope_integration.file_history_picker, { desc = 'File [B]ack history' })

    -- Commands
    vim.api.nvim_create_user_command('FileHistory', telescope_integration.file_history_picker, {})
  end
}
