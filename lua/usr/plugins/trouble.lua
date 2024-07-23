return {
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({
        use_lsp_diagnostic_signs = true,
      })
      require("which-key").register({
        ["<leader>d"] = {
          name = "+Diagnostics",
        },
      })
      vim.keymap.set(
        "n",
        "<leader>dw",
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<leader>dd",
        "<cmd>TroubleToggle diagnostics<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", ")t", function()
        require("trouble").next({ skip_groups = true, jump = true })
      end, { silent = true, noremap = true })
      vim.keymap.set("n", ")T", function()
        require("trouble").previous({ skip_groups = true, jump = true })
      end, { silent = true, noremap = true })
    end,
  },
}
