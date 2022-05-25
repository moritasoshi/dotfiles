local present, zen = pcall(require, "zen-mode")
if not present then
  return
end

zen.setup {
  window = {
    backdrop = 0.999,
    height = 0.9,
    width = 140,
    options = {
      number = false,
      relativenumber = false,
    },
    plugins = {
      gitsigns = false,
      twilight = true,
    },
  },
}
