local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("typescriptreact", {
  s("cl", {
    t("console.log("),
    i(1, "msg"),
    t(")"),
  }),
})

require("luasnip.loaders.from_vscode").lazy_load() -- Activate friendly snippets
