-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local telescope = require("telescope.builtin")
local dap = require("dap")

-- Telescope
vim.keymap.set("n", "<leader>ff", telescope.live_grep, { desc = "Telescope: Live Grep" })

-- Dap
vim.keymap.set("n", "<F5>", function()
  dap.continue()
end, { desc = "Start/Continue Debug" })
vim.keymap.set("n", "<F10>", function()
  dap.step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", function()
  dap.step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", function()
  dap.step_out()
end, { desc = "Step Out" })
vim.keymap.set("n", "<Leader>b", function()
  dap.toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional Breakpoint" })
