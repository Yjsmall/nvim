return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      menu = {
        border = "rounded",
        draw = {
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              -- Optionally, you may also use the highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
          treesitter = { "lsp" },
          columns = {
            { "label", "label_description" },
            { "kind_icon", gap = 2, "kind" },
          },
        },
        auto_show = function(ctx)
          return ctx.mode ~= "cmdline" and not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
        end,
      },
    },
  },
}
