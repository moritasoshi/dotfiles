--[[--
  Summary. Vimへのフォーカス取得と挿入モード離脱時にひらがな から 英字 にIME変換する

  Requirements. im-select must be installed.

  Reference. https://github.com/brglng/vim-im-select


  @todo
  InsertEnter, FocusLost時に元のIMEにswitch-backする?
]]

local ja = "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese"
local en = "com.apple.inputmethod.Kotoeri.RomajiTyping.Roman"

vim.api.nvim_create_augroup("_MSImSelect", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "InsertLeave" }, {
  callback = function()
    vim.cmd(string.format("call system('im-select %s')", en))
  end,
  group = "_MSImSelect",
})
