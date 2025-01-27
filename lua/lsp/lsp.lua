return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Ensure mason installs the server
      clangd = {
        cmd = {
          "clangd",
          "--enable-config",
        },
      },
    },
    setup = {
      clangd = function(_, opts)
        local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
        require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
        return false
      end,
    },
  },
}
