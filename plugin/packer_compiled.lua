-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/gilles/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/gilles/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/gilles/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/gilles/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/gilles/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/bufdelete.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  phpactor = {
    loaded = false,
    needs_bufread = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/opt/phpactor"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/suda.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tree-sitter-html"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/tree-sitter-html"
  },
  ["tree-sitter-lua"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/tree-sitter-lua"
  },
  ["tree-sitter-php"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/tree-sitter-php"
  },
  ["twig.vim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/twig.vim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-asterisk"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-asterisk"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-cutlass"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-cutlass"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-expand-region"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-expand-region"
  },
  ["vim-git"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-git"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-sort-motion"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-sort-motion"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-subversive"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-subversive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-textobj-entire"
  },
  ["vim-textobj-indent"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-textobj-indent"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vim-yoink"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/vim-yoink"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/gilles/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType php ++once lua require("packer.load")({'phpactor'}, { ft = "php" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
