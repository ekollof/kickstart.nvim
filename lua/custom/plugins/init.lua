-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'numToStr/Comment.nvim', opts = {} }, -- comment region with gc
  'tpope/vim-fugitive',
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'folke/todo-comments.nvim', -- highlight TODO/NOTE etc in comments
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    opts = {
      signs = false,
    }
  },
}
