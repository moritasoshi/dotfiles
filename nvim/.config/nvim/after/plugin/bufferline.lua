local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {}

local nmap = require("moritasoshi.keymap").nmap

nmap { "L", ":BufferLineCycleNext<CR>", {silent = true} }
nmap { "H", ":BufferLineCyclePrev<CR>", {silent = true} }
