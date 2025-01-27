return {
  "nvimdev/dashboard-nvim",
  opt = {
    theme = "Doom",
    shortcut_type = "number",
    hide = {
      -- this is taken care of by lualine
      -- enabling this messes up the actual laststatus setting after loading a file
      statusline = true,
    },
  },
}
