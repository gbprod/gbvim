local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.api.nvim_command("packadd packer.nvim")
end

local packer = require("packer")

vim.g.root_dir = vim.fn.fnamemodify(vim.fn.resolve(vim.fn.expand("<sfile>:p")), ":h")

local use = packer.use

local layers = {
  require("usr.options"),
  require("usr.system"),
  require("usr.ui"),
  require("usr.filetree"),
  require("usr.homepage"),
  require("usr.edit"),
  require("usr.yanking"),
  require("usr.completion"),
  require("usr.treesitter"),
  require("usr.diagnostics"),
  require("usr.finder"),
  require("usr.lsp"),
  require("usr.motions"),
  require("usr.git"),
  require("usr.search"),
  require("usr.terminal"),
  require("usr.project"),
  require("usr.repl"),
  require("usr.scratchpad"),
  require("usr.tests"),

  require("usr.language.php"),
  require("usr.language.html"),
  require("usr.language.lua"),
  require("usr.language.json"),
  require("usr.language.css"),
  require("usr.language.javascript"),
  require("usr.language.sql"),
  require("usr.language.sh"),
  require("usr.language.yaml"),
  require("usr.language.python"),
  require("usr.language.markdown"),
  require("usr.language.cpp"),
}

packer.startup(function()
  use("wbthomason/packer.nvim")

  for _, layer in pairs(layers) do
    if layer.plugins ~= nil then
      layer.plugins(use)
    end
  end
end)

for _, layer in pairs(layers) do
  if layer.setup ~= nil then
    layer.setup()
  end
end

local map = vim.keymap.set
for _, layer in pairs(layers) do
  if layer.bindings ~= nil then
    layer.bindings(map)
  end
end
