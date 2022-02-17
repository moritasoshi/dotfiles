
lua vim.g.mapleader = " "

" Disale unusing features
lua require("moritasoshi.disable_builtin")
lua require("moritasoshi.globals")


" Load plugins
" wanna change to the Lua based package manager
source ~/.config/nvim/plugins.vim

" For better development
lua pcall(require, "impatient")

lua vim.opt.termguicolors = true
lua require("colorizer").setup()
lua require("mkdir")

lua require("moritasoshi.lsp")
lua require("moritasoshi.telescope")

""" Commands -------------------------
command! -nargs=0 Hankaku   :%s/０/0/ge|%s/１/1/ge|%s/２/2/ge|%s/３/3/ge|%s/４/4/ge|%s/５/5/ge|%s/６/6/ge|%s/７/7/ge|%s/８/8/ge|%s/９/9/ge
command! -nargs=0 ToCamel   :s#_\(\l\)#\u\1#g
command! -nargs=0 ToUpCamel :1,$s/_\([a-z]\)/\u\1/g
command! -nargs=0 ToSnake   :%s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g
command! -nargs=0 So        :so ~/.config/nvim/init.vim

