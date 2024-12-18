return function()
  vim.keymap.set("n", "<c-Left>", ":<C-u>wincmd h<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<c-Right>", ":<C-u>wincmd l<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<c-Up>", ":<C-u>wincmd k<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<c-Down>", ":<C-u>wincmd j<CR>", { noremap = true, silent = true })

  vim.keymap.set("n", "<PageUp>", "<C-U>", {})
  vim.keymap.set("n", "<PageDown>", "<C-D>", {})
  vim.keymap.set("i", "<PageUp>", "<C-O><C-U>", {})
  vim.keymap.set("i", "<PageDown>", "<C-O><C-D>", {})

  vim.keymap.set("n", "<c-s>", ":<c-u>update<CR>", { noremap = true })
  vim.keymap.set("v", "<c-s>", ":<c-u>update<CR>gv", { noremap = true })
  vim.keymap.set("i", "<C-s>", "<C-o>:update<CR>", { noremap = true })

  vim.keymap.set("n", "<C-S-Down>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "which_key_ignore" })
  vim.keymap.set("n", "<C-S-Up>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "which_key_ignore" })
  vim.keymap.set("i", "<C-S-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true, desc = "which_key_ignore" })
  vim.keymap.set("i", "<C-S-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true, desc = "which_key_ignore" })
  vim.keymap.set("v", "<C-S-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "which_key_ignore" })
  vim.keymap.set("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "which_key_ignore" })

  vim.keymap.set("n", ")O", "<cmd>pu! _<cr>:']+1<cr>", { noremap = true, desc = "which_key_ignore" })
  vim.keymap.set("n", ")o", "<cmd>pu _<cr>:'[-1<cr>", { noremap = true, desc = "which_key_ignore" })
  -- vim.keymap.set("n", "<leader>;", "A;<C-c>", { desc = "which_key_ignore" })
  -- vim.keymap.set("n", "<leader>,", "A,<C-c>", { desc = "which_key_ignore" })

  vim.keymap.set("x", "ax", "<Plug>(textobj-comment-a)", {})
  vim.keymap.set("o", "ax", "<Plug>(textobj-comment-a)", {})
  vim.keymap.set("x", "ix", "<Plug>(textobj-comment-i)", {})
  vim.keymap.set("o", "ix", "<Plug>(textobj-comment-i)", {})

  vim.keymap.set("n", "(l", "<cmd>lprevious<cr>", {})
  vim.keymap.set("n", ")l", "<cmd>lnext<cr>", {})
  vim.keymap.set("n", "(L", "<cmd>lfirst<cr>", {})
  vim.keymap.set("n", ")L", "<cmd>llast<cr>", {})
  vim.keymap.set("n", "(q", "<cmd>cprevious<cr>", {})
  vim.keymap.set("n", ")q", "<cmd>cnext<cr>", {})
  vim.keymap.set("n", "(Q", "<cmd>cfirst<cr>", {})
  vim.keymap.set("n", ")Q", "<cmd>clast<cr>", {})

  vim.keymap.set({ "o", "x" }, "vp", function()
    require("yanky.textobj").last_put()
  end, {})

  -- Toggle relative line numbers
  vim.keymap.set("n", "<leader>tn", function()
    vim.opt.relativenumber = not vim.opt.relativenumber._value
  end, { desc = "Toggle relative line numbers" })
end
