local del = vim.keymap.del
local set = vim.keymap.set

-- Move to window using the <ctrl> hjkl keys
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")

set("n", "<C-Left>", "<C-w>h", { desc = "Go to Left Window", remap = true })
set("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
set("n", "<C-Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
set("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Move Lines
del("n", "<A-j>")
del("n", "<A-k>")
del("i", "<A-j>")
del("i", "<A-k>")
del("v", "<A-j>")
del("v", "<A-k>")

-- buffers
del("n", "<S-h>")
del("n", "<S-l>")
del("n", "[b")
del("n", "]b")
del("n", "<leader>bb")
del("n", "<leader>`")
del("n", "<leader>bd")
del("n", "<leader>bo")
del("n", "<leader>bD")

set("n", "<A-Left>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
set("n", "<A-Right>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
set("n", ")b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
set("n", ")B", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
set("n", '<leader>"', "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
set("n", "<A-q>", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
set("n", "<leader>bdo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })

-- Clear search with <esc>
set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
set({ "i", "n" }, "<C-l>", "<cmd>noh<cr>", { desc = "Clear hlsearch" })

-- lazy
del("n", "<leader>l")

-- new file
del("n", "[q")
del("n", "]q")
set("n", ")Q", vim.cmd.cprev, { desc = "Previous Quickfix" })
set("n", ")q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
del("n", "]d")
del("n", "[d")
del("n", "]e")
del("n", "[e")
del("n", "]w")
del("n", "[w")

set("n", ")d", diagnostic_goto(true), { desc = "Next Diagnostic" })
set("n", ")D", diagnostic_goto(false), { desc = "Prev Diagnostic" })
set("n", ")e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
set("n", ")E", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
set("n", ")w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
set("n", ")W", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- toggle options
del("n", "<leader>ub") -- background

-- quit
del("n", "<leader>qq")

-- LazyVim Changelog
set("n", "<leader>L", function()
  LazyVim.news.changelog()
end, { desc = "LazyVim Changelog" })

-- floating terminal
set("n", "<leader>fT", function()
  Snacks.terminal.open()
end, { desc = "Terminal (cwd)" })
set("n", "<leader>ft", function()
  Snacks.terminal.open(nil, {
    cwd = LazyVim.root(),
  })
end, { desc = "Terminal (Root Dir)" })

set("n", "<m-z>", function()
  Snacks.terminal(nil, {
    cwd = LazyVim.root(),
    win = {
      style = "float",
    },
  })
end, { desc = "Terminal (Root Dir)" })
set("t", "<m-z>", "<cmd>close<cr>", { desc = "Hide Terminal" })
set("t", "<C-o>", [[<C-\><C-n>]], { silent = true })

set("n", "<PageUp>", "<C-U>", {})
set("n", "<PageDown>", "<C-D>", {})
set("i", "<PageUp>", "<C-O><C-U>", {})
set("i", "<PageDown>", "<C-O><C-D>", {})

set("n", ")O", "<cmd>pu! _<cr>:']+1<cr>", { noremap = true, desc = "Insert empty line before" })
set("n", ")o", "<cmd>pu _<cr>:'[-1<cr>", { desc = "Insert empty line after" })

set("n", "<c-z>", "<nop>")

_G.dd = function(...)
  Snacks.debug.inspect(...)
end
_G.bt = function()
  Snacks.debug.backtrace()
end
vim.print = _G.dd
