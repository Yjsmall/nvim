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
        on_attach = function(client, bufnr)
          local filetype = vim.bo[bufnr].filetype
          local flags = {}
          
          if filetype == "c" then
            flags = { "--std=c11" }
          elseif filetype == "cpp" then
            flags = { "--std=c++20" }
          end
          
          client.config.settings.clangd = {
            fallbackFlags = flags,
            flags = flags
          }
          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end,
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
