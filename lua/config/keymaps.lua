-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del
map("n", ";", ":", { desc = "Cmd" })
map("n", "<leader>fw", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })

unmap("n", "<leader>l")
