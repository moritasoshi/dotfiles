local status_ok, lspkind = pcall(require, "lspkind")
if not status_ok then
  return
end

lspkind.init {
  mode = "symbol_text",
  -- TODO: remove Codepoints
  -- symbol_map = {
  --   Text = "",
  --   Method = "",
  --   Function = "",
  --   Constructor = "",
  --   Field = "",
  --   Variable = "",
  --   Class = "",
  --   Interface = "",
  --   Module = "",
  --   Property = "",
  --   Unit = "",
  --   Value = "",
  --   Enum = "",
  --   Keyword = "",
  --   Snippet = "",
  --   Color = "",
  --   File = "",
  --   Reference = "",
  --   Folder = "",
  --   EnumMember = "",
  --   Constant = "",
  --   Struct = "",
  --   Event = "",
  --   Operator = "",
  --   TypeParameter = "",
  -- },
}
