-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Go to right window", remap = true })

local default_opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():append()
end, { desc = "Harpoon file" })
vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-h>", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-t>", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-n>", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-s>", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end)

vim.keymap.set("n", "<leader>p", function()
  require("telescope").extensions.projects.projects({})
end, { desc = "Open projects menu" })
