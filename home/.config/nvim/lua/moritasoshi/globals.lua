-- Global editor variables.
local globals = {
  strip_whitespace_on_save = 1, --strip whitespace on save
  strip_whitespace_confirm = 0,

  bullets_outline_levels = {'std-'},
  bullets_checkbox_markers = ' x',
  bullets_nested_checkboxes = 1,
  bullets_checkbox_partials_toggle = 1,

  gitblame_enabled = 0,

  -- simeji/winresizer
  winresizer_vert_resize = 3,
  winresizer_horiz_resize = 1,
  winresizer_start_key = "<M-g>", -- 使わないkeyを適当に入れてる
}

for k, v in pairs(globals) do
  vim.g[k] = v
end
