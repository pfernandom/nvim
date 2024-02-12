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

vim.keymap.set("n", "<leader>p", function()
  require("telescope").extensions.projects.projects({})
end, { desc = "Open projects menu" })

-- Obsidian
vim.keymap.set("n", "<leader>oo", ":ObsidianWorkspace <CR><leader>E", { desc = "Obsidian workspace", remap = true })
vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "Obsidian dailies (today)", remap = true })
vim.keymap.set("n", "<leader>oT", ":ObsidianTomorrow<CR>", { desc = "Obsidian dailies (tomrrow)", remap = true })
vim.keymap.set("n", "<leader>oY", ":ObsidianYesterday<CR>", { desc = "Obsidian dailies (yesterday)", remap = true })
vim.keymap.set("n", "<leader>oS", ":ObsidianSearch<CR>", { desc = "Obsidian search", remap = true })
vim.keymap.set("n", "<leader>ow", ":ObsidianWorkspaces<CR>", { desc = "All Obsidian workspaces" })

vim.keymap.set("n", "<leader>wt", ":hor terminal<CR>i", { desc = "Toggle terminal" })
