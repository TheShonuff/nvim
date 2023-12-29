-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "None", ctermbg = "None", blend = 0 })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None", ctermbg = "None", blend = 0, fg = "#ffffff" })

    vim.api.nvim_set_hl(0, "Float", { bg = "None", ctermbg = "None", blend = 0, fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "NoicePopup", { bg = "None", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermbg = "none", blend = 0 })

    vim.api.nvim_set_hl(0, "MsgArea", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "None", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NoicePopupmenu", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NoiceLspProgressTitle", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NoiceLspProgressClient", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NoiceMini", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NoiceFormatTitle", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", ctermbg = "none", blend = 0, guifg = "#ff0000" })

    vim.api.nvim_set_hl(0, "LineNr", { bg = "none", cterm = "none", blend = 0, guifg = "#ff0000" })
    vim.api.nvim_set_hl(0, "NoiceFormatProgressDone", { bg = "none", ctermbg = "none", blend = 0 })

    --        vim.api.nvim_set_hl(0, "NoiceCompletionMenu", { bg = "none", ctermbg = "none", blend = 0 })

    -- vim.api.nvim_set_hl(0, "NoiceLspProgressClient", { bg = "none", ctermbg = "none", blend = 0 })
  end,
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})
-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- leet code nvim
local once = false
local ft_maps = { python3 = "python" }
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*leetcode*.txt",
  callback = function(ctx)
    if not once then
      vim.ui.select({ "python3", "rust" }, {
        prompt = "Select language",
      }, function(choice)
        vim.bo.filetype = ft_maps[choice] or choice
      end)
    end
    once = true
  end,
})
