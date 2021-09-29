return {
  plugins = function(use)
    use({ "rhysd/reply.vim", cmd = { "Repl", "ReplAuto" } })
  end,

  bindings = function(map)
    local wk = require("which-key")
    wk.register({
      ["<leader>r"] = { name = "+Repl" },
      ["<leader>rr"] = { "<cmd>Repl<cr>", "Toggle Repl" },
      ["<leader>rs"] = { "<cmd>ReplSend<cr>", "Send to Repl" },
    }, {
      mode = "n",
    })
    wk.register({
      ["<leader>rs"] = { "<cmd>ReplSend<cr>", "Send to Repl" },
    }, {
      mode = "x",
    })
  end,
}
