local present, tree = pcall(require, "nvim-tree")
if not present then
  return
end

local list = {
  { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
  { key = "<C-e>", action = "edit_in_place" },
  { key = { "O" }, action = "edit_no_picker" },
  { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
  { key = "<C-v>", action = "vsplit" },
  { key = "<C-x>", action = "split" },
  { key = "t", action = "tabnew" },
  { key = "<", action = "prev_sibling" },
  { key = ">", action = "next_sibling" },
  { key = "P", action = "parent_node" },
  { key = "<BS>", action = "close_node" },
  { key = "<Tab>", action = "preview" },
  { key = "K", action = "first_sibling" },
  { key = "J", action = "last_sibling" },
  { key = "I", action = "toggle_ignored" },
  { key = "H", action = "toggle_dotfiles" },
  { key = "R", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "D", action = "trash" },
  { key = "r", action = "rename" },
  { key = "<C-r>", action = "full_rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "y", action = "copy_name" },
  { key = "Y", action = "copy_path" },
  { key = "gy", action = "copy_absolute_path" },
  { key = "[c", action = "prev_git_item" },
  { key = "]c", action = "next_git_item" },
  { key = "-", action = "dir_up" },
  { key = "s", action = "system_open" },
  { key = "q", action = "close" },
  { key = "g?", action = "toggle_help" },
  { key = "W", action = "collapse_all" },
  { key = "S", action = "search_node" },
  { key = "<C-k>", action = "toggle_file_info" },
  { key = ".", action = "run_file_command" },
}

tree.setup {
  view = {
    mappings = {
      custom_only = true,
      list = list,
    },
  },
  actions = {
    open_file = {
      resize_window = false,
    },
  },
}
