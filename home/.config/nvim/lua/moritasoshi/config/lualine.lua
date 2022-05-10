local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" }, -- Displays diagnostics for the defined severity types
  symbols = { error = " ", warn = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}
local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}
local filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}
local filename = {
  "filename",
  file_status = false,
}
local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}
local location = {
  "location",
  padding = 0,
}
-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

-- local colors = {
--   yellow = "#ECBE7B",
--   cyan = "#008080",
--   darkblue = "#081633",
--   green = "#98be65",
--   orange = "#FF8800",
--   violet = "#a9a1e1",
--   magenta = "#c678dd",
--   blue = "#51afef",
--   red = "#ec5f67",
-- }
-- local lsp_progress = {
--   "lsp_progress",
--   colors = {
--     percentage = colors.yellow,
--     title = colors.yellow,
--     message = colors.yellow,
--     spinner = colors.yellow,
--     lsp_client_name = colors.magenta,
--     use = true,
--   },
--   separators = {
--     component = " ",
--     progress = " | ",
--     percentage = { pre = "", post = "%% " },
--     title = { pre = "", post = ": " },
--     lsp_client_name = { pre = "[", post = "]" },
--     spinner = { pre = "", post = "" },
--     message = { commenced = "In Progress", completed = "Completed" },
--   },
--   display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
--   timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
--   spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
-- }
--
lualine.setup {
  options = {
    icons_enabled = true,
    theme = "dracula",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "packer" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch, diff },
    lualine_c = { filename },
    lualine_x = { diagnostics, "encoding", filetype, location, progress },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
