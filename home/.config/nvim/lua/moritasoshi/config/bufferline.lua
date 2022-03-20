local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {}

local nmap = require("moritasoshi.util.keymap").nmap

nmap { "L", ":BufferLineCycleNext<CR>" }
nmap { "H", ":BufferLineCyclePrev<CR>" }
