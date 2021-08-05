local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

local packer = require("packer")

local use = packer.use

local layers = {
    require 'options',
    require 'system',
    require 'ui',
    require 'edit'
}


packer.startup(
    function()
        use "wbthomason/packer.nvim"

        for _,layer in pairs(layers) do
            layer.plugins(use)
        end
    end
)
packer.sync()

for _,layer in pairs(layers) do
    layer.setup()
end

for _,layer in pairs(layers) do
    layer.bindings()
end
