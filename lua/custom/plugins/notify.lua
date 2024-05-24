local M = {
  {
    "rcarriga/nvim-notify",
    event = 'VeryLazy',
    config = function()
      require("notify").setup {
        background_colour = "#000000",
      }
    end
  }
}

return M
