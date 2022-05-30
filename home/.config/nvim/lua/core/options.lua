local opt = vim.opt
local g = vim.g
_G.moriso.opt = {}

opt.termguicolors = true

opt.syntax = "on"

opt.encoding = "utf-8"
opt.fileencodings = "utf-8,sjis,euc-jp,latin"

opt.virtualedit = "block"
opt.backspace = "indent,eol,start"
opt.ambiwidth = "single" -- Do not set "double"
opt.wildmenu = true
opt.title = true
opt.whichwrap = "b,s,h,l,<,>,[,],~"

opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.relativenumber = true -- Show line numbers
opt.number = true -- But show the actual number for the line we're on
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- I like having buffers stay around
opt.cursorline = true -- Highlight the current line
opt.equalalways = false -- I don't like my windows changing all the time
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 1000 -- Make updates happen faster
opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1

opt.belloff = "all" -- Just turn the dang bell off

opt.clipboard = "unnamedplus"

opt.inccommand = "split" -- Interractive for substitute
opt.swapfile = false -- Living on the edge
opt.shada = { "!", "'1000", "<50", "s10", "h" }

opt.mouse = "n"
opt.list = true
opt.listchars = {
  tab = "»-",
  trail = "-",
  eol = "↲",
}

-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
-- TODO: w, {v, b, l}
opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

g.mapleader = " "

-- use filetype.lua instead of filetype.vim
g.did_load_filetypes = 0
g.do_filetype_lua = 1

local globals = {
  strip_whitespace_on_save = 1, --strip whitespace on save
  strip_whitespace_confirm = 0,

  bullets_outline_levels = { "std-" },
  bullets_checkbox_markers = " x",
  bullets_nested_checkboxes = 1,
  bullets_checkbox_partials_toggle = 1,

  gitblame_enabled = 0,

  -- simeji/winresizer
  winresizer_vert_resize = 3,
  winresizer_horiz_resize = 1,
  winresizer_start_key = "<M-g>", -- 使わないkeyを適当に入れてる
}

for k, v in pairs(globals) do
  g[k] = v
end

-- disable some builtin vim plugins
local default_plugins = {
  "loaded_gzip",
  "loaded_zip",
  "loaded_zipPlugin",
  "loaded_tar",
  "loaded_tarPlugin",
  "loaded_getscript",
  "loaded_getscriptPlugin",
  "loaded_vimball",
  "loaded_vimballPlugin",
  "loaded_2html_plugin",
  "loaded_matchit",
  "loaded_matchparen",
  "loaded_logiPat",
  "loaded_rrhelper",
  "loaded_netrw",
  "loaded_netrwPlugin",
  "loaded_netrwSettings",
  "loaded_man",
  "loaded_remote_plugins",
  "loaded_shada_plugin",
  "loaded_spellfile_plugin",
  "loaded_tutor_mode_plugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

moriso.opt.listchars = vim.opt.listchars
