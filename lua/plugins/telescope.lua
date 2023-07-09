return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key"
          }
        }
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
      }
    }

    local builtin = require('telescope.builtin')
    local map = function (mode,lhr,rhr,opt)
      vim.keymap.set(mode,lhr,rhr,opt)
    end

    map('n', '<leader><leader>', builtin.find_files, {})
    map('n', '<leader>fg', builtin.live_grep, {})
    map('n', '<leader>fb', builtin.buffers, {})
    map('n', '<leader>fh', builtin.help_tags, {})

    map('n', 'gr', builtin.lsp_references, {})
    map('n', '<leader>gd', builtin.lsp_definitions, {})
  end
}
