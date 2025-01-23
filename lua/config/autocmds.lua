-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- Optional: You can also create an autocmd if you want to trigger actions on file type change

-- Function to run the correct command based on the file type

local function run_file()
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%:p") -- Full file path
  local basename = vim.fn.expand("%:r") -- Base file name without extension
  local flags = "-Wall -Wextra -pedantic -Wno-unused-parameter"

  if filetype == "c" then
    -- For C files, use clang with c99 standard
    vim.cmd("!clang -std=c99 " .. flags .. " -o " .. basename .. " " .. filename .. " && ." .. basename)
  elseif filetype == "cpp" then
    -- For C++ files, use clang++ with c++20 standard
    vim.cmd("!clang++ -std=c++20 " .. flags .. " -o " .. basename .. " " .. filename .. " && ." .. basename)
  elseif filetype == "python" then
    -- For Python files, use uv
    vim.cmd("!uv run " .. filename)
  else
    print("No run command defined for this filetype.")
  end
end

-- Create an autocmd group called 'run_c_py'
vim.api.nvim_create_augroup("run_prog", { clear = true })

-- Autocmd to run <leader>rf for specific file types (c, cpp, python)
vim.api.nvim_create_autocmd("FileType", {
  group = "run_prog",
  pattern = { "c", "cpp", "python" },
  callback = function()
    vim.keymap.set("n", "<leader>rf", run_file, { noremap = true, silent = true, desc = "run single prog" })
  end,
})
