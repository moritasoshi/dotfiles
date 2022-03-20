local ls = require("luasnip")

local s = ls.parser.parse_snippet

local date = function()
  return string.format(string.gsub(vim.bo.commentstring, "%%s", " %%s"), os.date())
end

ls.snippets = {
  all = {
    s("expand", date()),
  },
}

require("luasnip.loaders.from_vscode").lazy_load() -- Activate friendly snippets
