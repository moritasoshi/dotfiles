local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

-- Setup nvim-cmp.
vim.o.completeopt = "menuone,noinsert,noselect"
local types = require("cmp.types")
local str = require("cmp.utils.str")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

local mapping = {
  ["<ESC>"] = cmp.mapping {
    i = function(fallback) -- Close the completion menu and go back to normal mode.
      cmp.mapping.abort()
      fallback()
    end,
    c = cmp.mapping.close(),
  },
  ["<CR>"] = function(fallback)
    if cmp.visible() then
      if cmp.get_selected_entry() then
        cmp.confirm()
      else
        cmp.abort()
      end
    else
      fallback() -- If you are using vim-endwise, this fallback function will be behaive as the vim-endwise.
    end
  end,
  ["<Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
    else
      fallback()
    end
  end,
  ["<S-Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
    else
      fallback()
    end
  end,
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),
}

cmp.setup {
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      luasnip.lsp_expand(args.body)
    end,
  },

  formatting = {
    fields = {
      cmp.ItemField.Abbr,
      cmp.ItemField.Kind,
      cmp.ItemField.Menu,
    },
    format = lspkind.cmp_format {
      with_text = false,
      menu = {
        buffer = "BUF",
        cmp_tabnine = "TN",
        nvim_lsp = "LSP",
        path = "PATH",
        luasnip = "SNIP",
        calc = "CALC",
        spell = "SPELL",
        emoji = "EMOJI",
      },
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        -- Get the full snippet (and only keep first line)
        local word = entry:get_insert_text()
        if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
          word = vim.lsp.util.parse_snippet(word)
        end
        word = str.oneline(word)

        local max = 50
        if string.len(word) >= max then
          local before = string.sub(word, 1, math.floor((max - 3) / 2))
          word = before .. "..."
        end

        if
          entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
          and string.sub(vim_item.abbr, -1, -1) == "~"
        then
          word = word .. "~"
        end

        vim_item.abbr = word
        return vim_item
      end,
    },
  },
  mapping = mapping,
  sources = cmp.config.sources {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer", keyword_length = 5, max_item_count = 5 },
    { name = "cmp_tabnine" },
    { name = "path" },
  },
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    { name = "cmdline" },
    { name = "path" },
  },
})
