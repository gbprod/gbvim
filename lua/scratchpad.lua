local scratchpad = {}

function scratchpad.plugins(use)
  use("m-demare/attempt.nvim")
end

function scratchpad.setup()
  require("attempt").setup({
    dir = "/home/gilles/workspace/scratchpad",
    autosave = true,
    list_buffers = true,
    initial_content = {},
    ext_options = { "php", "sql", "lua", "js", "py", "" },
    format_opts = { [""] = "[Scratchpad]" }, -- How they'll look
    run = {},
  })

  require("telescope").load_extension("attempt")
end

function scratchpad.bindings(_)
  local wk = require("which-key")
  local attempt = require("attempt")

  wk.register({
    ["<leader>fs"] = {
      name = "+Scratchpad",
      n = { attempt.new_select, "New scratchpad" },
      N = { attempt.new_input_ext, "New scratchpad extension" },
      s = { "<cmd>Telescope attempt<cr>", "List" },
      d = { attempt.delete_buf, "Delete buf" },
      r = { attempt.rename_buf, "Rename buf" },
    },
  }, {
    mode = "n",
  })
end

return scratchpad
