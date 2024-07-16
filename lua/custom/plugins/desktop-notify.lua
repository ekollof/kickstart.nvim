local function isgraphical ()
  local session = os.getenv("XDG_SESSION_TYPE")
  if session == "wayland" or session == "x11" or session == "xorg" then
    return true
  else
    return false
  end
end

local M = {
  {
    "HiPhish/desktop-notify-nvim",
    config = function()
      vim.notify = require("desktop_notify").notify_send
    end
  }
}

if isgraphical() then
  return M
end

