-- Snippets and auto completions
return {
  -- Overrides completions
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  -- Use vim-surround
  -- { "echasnovski/mini.surround", enabled = false },
  -- "tpope/vim-surround",

  -- makes some plugins dot-repeatable
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- <C-A>/<C-X> Enhancement (1999-12-31 -> 2000-01-01)
  { "tpope/vim-speeddating", event = "VeryLazy" },

  -- Text manipulation
  {
    "godlygeek/tabular",
    config = function()
      vim.cmd([[
      AddTabularPattern! nvar /nvarchar(\w*)/l1r0
      AddTabularPattern! f_comma /^[^,]*\zs,/l0l1
      AddTabularPattern! f_colon /^[^:]*\zs:\zs/l0r1
      AddTabularPattern! f_equal /^[^=]*\zs=/
      AddTabularPattern! f_quote /^[^"]*\zs"/l1r0
      AddTabularPattern! f_space /^[^ ]*\zs /l0
      AddTabularPattern! commas /,\zs/l0l1
      AddTabularPattern! colons /:\zs/l0l1
      ]])
    end,
    cmd = "Tab",
    keys = {
      { "<leader>t", ":Tab ", desc = "Tabularize" },
    },
  },
}
