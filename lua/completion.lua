local layer = {}

layer.plugins = function(use)
  use 'windwp/nvim-autopairs'
  use 'hrsh7th/nvim-compe'
end

layer.setup = function()
  require('nvim-autopairs').setup{}

  require("nvim-autopairs.completion.compe").setup({
    map_cr = true,
    map_complete = true,
    auto_select = true,
  })

  vim.o.completeopt = "menuone,noselect"

  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = {
      border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
      winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
      max_width = 120,
      min_width = 59,
      max_height = math.floor(vim.o.lines * 0.3),
      min_height = 1,
    };

    source = {
      path = true;
      buffer = true;
      calc = false;
      nvim_lsp = true;
      nvim_lua = true;
      vsnip = false;
      ultisnips = false;
      luasnip = false;
      omni = false;
      treesitter = false;
    };
  }
end

layer.bindings = function(map)
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
      return true
    else
      return false
    end
  end

  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn['compe#complete']()
    end
  end
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    else
      return t "<S-Tab>"
    end
  end

  map('i', '<C-Space>', 'compe#complete()', { noremap = true, expr = true })
  -- map("i", "<CR>", "compe#confirm({lexima#expand('<LT>CR>', 'i'))", { noremap = true, expr = true })
  map("i", "<CR>", "compe#confirm({ 'keys': luaeval(\"require 'nvim-autopairs'.autopairs_cr()\"), 'select': v:true })", { expr = true })
  map('i', '<C-e>', "compe#close('<C-e>')", { noremap = true, expr = true })
  map('i', '<C-f>', "compe#scroll({ 'delta': +4 })", { noremap = true, expr = true })
  map('i', '<C-d>', "compe#scroll({ 'delta': -4 })", { noremap = true, expr = true })

  map("i", "<Tab>", "v:lua.tab_complete()", { noremap = true, expr = true })
  map("s", "<Tab>", "v:lua.tab_complete()", { noremap = true, expr = true })
  map("i", "<S-Tab>", "v:lua.s_tab_complete()", { noremap = true, expr = true })
  map("s", "<S-Tab>", "v:lua.s_tab_complete()", { noremap = true, expr = true })
end

return layer

