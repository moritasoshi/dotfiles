local schemas = {}
local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
if status_ok then
  schemas = jsonls_settings.get_default_schemas()
end

schemas = vim.tbl_deep_extend("force", schemas, require("schemastore").json.schemas())

local opts = {
  cmd = { "nodebrew", "exec", "latest", "vscode-json-language-server", "--stdio"},
  settings = {
    json = {
      schemas = schemas,
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}

return opts
