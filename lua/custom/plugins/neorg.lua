local M = {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim' },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = '*', -- Pin Neorg to the latest stable release
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {
            config = {
              icon_preset = 'varied',
            },
          }, -- icons
          ['core.keybinds'] = {}, -- default keybinds
          ['core.completion'] = {
            config = {
              engine = 'nvim-cmp',
            },
          }, -- Completion with nvim-cmp
          ['core.journal'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/Nextcloud/Notes',
                default_workspace = 'notes',
              },
            },
            ['core.tangle'] = {},
          },
        },
      }
    end,
  },
}

return M
