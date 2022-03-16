--[=====[
## 準備
- im-select をinstall
brew tap daipeihust/tap && brew install im-select


## やりたいこと
- normal mode で必ず Roman
- insert mode で以前の 言語

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
        " autocmd BufEnter * call system('im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman')
        " autocmd InsertEnter * call system('im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman')
        autocmd InsertLeave * call system('im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman')
    augroup END
]])

vim.cmd([[
nnoremap あ a
nnoremap い i
nnoremap お o
]])
