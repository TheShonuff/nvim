return {
  {
    "hkupty/iron.nvim",
    config = function()
      local iron = require("iron.core")
      iron.setup({
        config = {
          sratch_repl = true,
          repl_definition = {
            python = require("iron.fts.python").ipython,
          },
          repl_open_cmd = require("iron.view").right("50%"),
        },
        keymaps = {
          send_line = "<space>sl",
          send_file = "<space>sf",
        },
        ignore_blank_lines = true,
      })
    end,
  },
}
