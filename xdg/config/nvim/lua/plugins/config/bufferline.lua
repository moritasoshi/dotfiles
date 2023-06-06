local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
  },
}

local map = moriso.map

map("n", "L", ":BufferLineCycleNext<CR>")
map("n", "H", ":BufferLineCyclePrev<CR>")
