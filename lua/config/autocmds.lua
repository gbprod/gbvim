vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "StatusLine", { link = "lualine_c_normal" })
  end,
})
