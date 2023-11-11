return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    cmd = "VenvSelect",
    opts = {
      dap_enabled = true,
    },
    keys = { { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { { "black" } },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
        { "<leader>dPc", function() require('dap-python').test_class() end,  desc = "Debug Class" },
      },
      config = function()
        local path = require("mason-registry").get_package("debugpy"):get_install_path()
        require("dap-python").setup(path .. "/venv/bin/python")
      end,
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>dP"] = { name = "+Python" },
      },
    },
  },
  -- NeoTest
  --  {
  --    "nvim-neotest/neotest",
  --    optional = true,
  --    dependencies = {
  --      "nvim-neotest/neotest-python",
  --    },
  --    opts = {
  --      adapters = {
  --        ["neotest-python"] = {
  --          -- The neotest-python adapter is not installed by default.
  --          -- You can install it with :NeotestInstall neotest-python
  --          runner = "pytest",
  --        },
  --      },
  --    },
  --  },
}
