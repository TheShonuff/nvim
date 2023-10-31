-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.guicursor = ""
opt.tabstop = 2
opt.shiftwidth = 4

opt.hlsearch = false
opt.incsearch = false
opt.scrolloff = 10
opt.wrap = true

opt.termguicolors = true
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
