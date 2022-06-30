local present, ls = pcall(require, "luasnip")
if not present then
  return
end

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- YYYYMMDD for all
ls.add_snippets("all", {
  s("dateYMD", { t(os.date("%Y%m%d")) }),
})

-- console.log for javascript
ls.add_snippets("javascript", {
  s("cl", {
    t("console.log("),
    i(1, "msg"),
    t(")"),
  }),
})
ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascript" })

require("luasnip.loaders.from_vscode").lazy_load() -- Activate friendly snippets
