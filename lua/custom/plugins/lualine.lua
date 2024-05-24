local M = {}

M = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- Define a function to check that ollama is installed and working
    local function get_condition()
      return package.loaded['ollama'] and require('ollama').status ~= nil
    end

    -- Define a function to check the status and return the corresponding icon
    local function get_status_icon()
      local status = require('ollama').status()

      if status == 'IDLE' then
        return 'OLLAMA IDLE'
      elseif status == 'WORKING' then
        return 'OLLAMA BUSY'
      end
    end

    require('lualine').setup {
      sections = {
        lualine_a = {},
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_v = { get_status_icon, get_condition },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
        lualine_x = {
          {
            require('noice').api.status.message.get_hl,
            cond = require('noice').api.status.message.has,
          },
          {
            require('noice').api.status.command.get,
            cond = require('noice').api.status.command.has,
            color = { fg = '#ff9e64' },
          },
          {
            require('noice').api.status.mode.get,
            cond = require('noice').api.status.mode.has,
            color = { fg = '#ff9e64' },
          },
          {
            require('noice').api.status.search.get,
            cond = require('noice').api.status.search.has,
            color = { fg = '#ff9e64' },
          },
        },
      },
      options = {
        theme = 'pywal-nvim',
      },
    }
  end,
}

return M
