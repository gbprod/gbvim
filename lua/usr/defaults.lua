return function()
    vim.keymap.set("n", "<c-Left>", ":<C-u>wincmd h<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<c-Right>", ":<C-u>wincmd l<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<c-Up>", ":<C-u>wincmd k<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<c-Down>", ":<C-u>wincmd j<CR>", { noremap = true, silent = true })

    vim.keymap.set("n", "<PageUp>", "<C-U>", {})
    vim.keymap.set("n", "<PageDown>", "<C-D>", {})
    vim.keymap.set("i", "<PageUp>", "<C-O><C-U>", {})
    vim.keymap.set("i", "<PageDown>", "<C-O><C-D>", {})

    vim.cmd([[
    cnoreabbrev h vertical help
    cnoreabbrev qa confirm qa
    cnoreabbrev q confirm q
  ]])
end
