vim.cmd([[
  setlocal textwidth=80
  setlocal colorcolumn=+1,+41
  iabbrev ret return
  iabbrev pub public
  iabbrev pri private
  iabbrev pro protected
  iabbrev con const
  iabbrev thr throw
  iabbrev impl implements
  iabbrev ext extends
  iabbrev fun function
  iabbrev str string
  iabbrev rea readonly
  ]])

vim.keymap.set("n", "<leader>li", function()
  require("phpactor").rpc("import_class")
end, { desc = "Import the name under the cusor", buffer = 0 })
vim.keymap.set("n", "<leader>lI", function()
  require("phpactor").rpc("import_missing_classes")
end, { desc = "Attempt to import all non-resolvable classes", buffer = 0 })
vim.keymap.set("n", "<leader>lm", function()
  require("phpactor").rpc("context_menu")
end, { desc = "Show the context menu for the current cursor position", buffer = 0 })
vim.keymap.set("n", "<leader>ln", function()
  require("phpactor").rpc("navigate")
end, { desc = "Navigate", buffer = 0 })
vim.keymap.set("n", "<leader>lcc", function()
  require("phpactor").rpc("copy_class")
end, { desc = "Copy the current class", buffer = 0 })
vim.keymap.set("n", "<leader>lcm", function()
  require("phpactor").rpc("move_class")
end, { desc = "Move the current class", buffer = 0 })
vim.keymap.set("n", "<leader>lci", function()
  require("phpactor").rpc("class_inflect")
end, { desc = "Inflect a new class from the current class", buffer = 0 })
vim.keymap.set("n", "<leader>lca", function()
  require("phpactor").rpc("generate_accessors")
end, { desc = "Generate accessors", buffer = 0 })
vim.keymap.set("n", "<leader>lct", function()
  require("phpactor").rpc("transform")
end, { desc = "Show transform context menu", buffer = 0 })
vim.keymap.set("n", "<leader>lce", function()
  require("phpactor").rpc("class_expand")
end, { desc = "Expand the class name", buffer = 0 })
vim.keymap.set("n", "<leader>lcn", function()
  require("phpactor").rpc("class_new")
end, { desc = "Create a new class", buffer = 0 })
