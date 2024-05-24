local M = {
  {
    'David-Kunz/gen.nvim',
    config = function()
      require('gen').setup {
        -- config stuff here
        model = 'uncensored-llama',
      }
      vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')
    end,
  },
}

return M
