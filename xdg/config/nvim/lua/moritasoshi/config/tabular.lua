vim.cmd([[
AddTabularPattern! nvar /nvarchar(\w*)/l1r0
AddTabularPattern! f_comma /^[^,]*\zs,/l0l1
AddTabularPattern! f_colon /^[^:]*\zs:\zs/l0r1
AddTabularPattern! f_equal /^[^=]*\zs=/
AddTabularPattern! f_quote /^[^"]*\zs"/l1r0
AddTabularPattern! f_space /^[^ ]*\zs /l0
]])
