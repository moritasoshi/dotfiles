local present, tree = pcall(require, "nvim-tree")
if not present then
  return
end

tree.setup {
  actions = {
    open_file = {
      resize_window = false,
    },
  },
}
