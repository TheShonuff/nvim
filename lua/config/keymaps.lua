-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set

keymap("i", "jk", "<esc>")

-- Popoer scrolling
keymap("n", "<c-d>", "<c-d>zz")
keymap("n", "<c-d>", "<c-u>zz")
