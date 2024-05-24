
-- utility function to watch a file for changes
--
local w = vim.uv.new_fs_event()

---@diagnostic disable-next-line: unused-local
local function on_change(err, fname, status)
  vim.api.nvim_command 'colorscheme pywal'
end

function watch_file(fname)
  local fullpath = vim.api.nvim_call_function('fnamemodify', { fname, ':p' })
  ---@diagnostic disable-next-line: need-check-nil
  w:start(
    fullpath,
    {},
    vim.schedule_wrap(function(...)
      on_change(...)
    end)
  )
end

vim.api.nvim_command "command! -nargs=1 Watch call luaeval('watch_file(_A)', expand('<args>'))"

local M = {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    -- 'folke/tokyonight.nvim',
    'AlphaTechnolog/pywal.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'pywal'
      watch_file '~/.cache/wal/colors'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
    config = function()
      require('pywal').setup()
    end,
  },
  {'xiyaowong/transparent.nvim',
    config = function()
      require("transparent").setup({})

      -- Toggle transparency
      vim.keymap.set('n', '<leader>tt', '<CMD>:TransparentToggle<cr><CMD>:colorscheme pywal<cr>')
    end,
  }
}

-- check if pywal actually exists first. Otherwise, use default colorscheme.
local colorfile = os.getenv("HOME") .. '/.cache/wal/colors'
local fileexists = io.open(colorfile, "r")

if fileexists ~= nil then -- we have pywal
  return M
else
  return
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  }
end
