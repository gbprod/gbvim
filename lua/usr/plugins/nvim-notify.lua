return {
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        render = "wrapped-compact",
        top_down = false,
        on_open = function(win)
          if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_set_config(win, { border = "none" })
          end
        end,
      })
      vim.notify = require("notify")
    end,
  },
}
