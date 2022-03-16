--[=====[
## 準備
- im-select をinstall
brew tap daipeihust/tap && brew install im-select


## やりたいこと
- normal mode で必ず Roman
- insert mode で以前の 言語
- insert mode 中のIMEを保存する

--]=====]

-- local to_ja = string.format(":call system('%s')", "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese")
-- local to_us = string.format(":call system('%s')", "com.apple.inputmethod.Kotoeri.RomajiTyping.Roman")
--
-- vim.api.nvim_create_augroup("MacImSelect", { clear = true })
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   cmd = vim.cmd([[vim]]),
--   callback = function()
--     vim.highlight.on_yank { higroup = "Substitute", timeout = 150, on_macro = true }
--   end,
--   group = "MacImSelect",
-- })

vim.cmd([[
    augroup win_ime_con
        autocmd!
        autocmd BufEnter * let g:mac_ime_con_is_insert = 0
        autocmd InsertEnter * call system('im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman')
        autocmd InsertLeave * call system('im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman')
    augroup END
]])

local saveMode = function(mode)
  vim.g.ime_mode = mode
end

-- modeからim codeに変換する
local convToCode = function()
  local mode = vim.g.ime_mode
  local prefix = "com.apple.inputmethod.Kotoeri.RomajiTyping."
  if mode == 1 then
    return prefix .. "Japanese"
  end
  return prefix .. "Roman"
end
