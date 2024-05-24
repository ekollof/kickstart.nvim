local M = {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
        theme = 'hyper',
        config = {
          header = {'',
            ' mm   m               m    m             ',
            ' #"m  #  mmm    mmm   "m  m" mmm    mmmmm',
            ' # #m # #"  #  #" "#   #  #    #    # # #',
            ' #  # # #""""  #   #   "mm"    #    # # #',
            ' #   ## "#mm"  "#m#"    ##   mm#mm  # # #',
            '',
            'Learn from other people\'s mistakes, you don\'t have time to make your own',
            '',
          }, --your header
          shortcut = {
            { icon = '󰊳 ', desc = 'Update', group = '@property', action = 'Lazy update', key = 'u' },
            { icon = ' ', desc = 'Open folder', group = '@property', action = 'Oil', key = '-' },
            { icon = '⚙ ', desc = 'Neovim Config', group = '@property', action = 'e ~/.config/nvim', key = 'c' },
          },
          packages = { enable = true },
          footer = {}  --your footer
        }
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  }
}

return M
