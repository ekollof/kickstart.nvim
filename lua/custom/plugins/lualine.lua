local M = {}

M = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      sections = {
        lualine_a = {},
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_v = { get_status_icon, get_condition },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      options = {
        theme = 'pywal-nvim',
      },
    }
  end,
}

return M
