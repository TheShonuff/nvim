return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    if require("lazyvim.util").has("noice.nvim") then
      opts.defaults["<leader>T"] = { name = "+Terminal" }
      opts.defaults["<leader>d"] = { name = "+DAP" }
    end
  end,
}
