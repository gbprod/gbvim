local ui = {}

function ui.plugins(use)
  use("shaunsingh/nord.nvim")
  use("nvim-lualine/lualine.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("lukas-reineke/indent-blankline.nvim")
  use("folke/which-key.nvim")
  -- use("linty-org/key-menu.nvim")
  use("romgrk/barbar.nvim")
  use("famiu/bufdelete.nvim")
  use("norcalli/nvim-colorizer.lua")
  use("vigoux/notifier.nvim")
  use("SmiteshP/nvim-navic")
  use("folke/zen-mode.nvim")
end

function ui.setup()
  vim.g.nord_borders = true
  require("nord").set()

  vim.api.nvim_set_hl(0, "Search", { fg = "NONE", bg = "#4C566A" })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#3B4252" })
  vim.api.nvim_set_hl(0, "MatchParen", { fg = "NONE", bg = "#4C566A" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#D8DEE9" })
  vim.api.nvim_set_hl(0, "qfLineNr", { fg = "#88C0D0" })

  vim.api.nvim_set_hl(0, "TSParameter", { link = "Identifier" })
  vim.api.nvim_set_hl(0, "TSProperty", { fg = "#D8DEE9" })
  vim.api.nvim_set_hl(0, "TSType", { fg = "#8FBCBB" })
  vim.api.nvim_set_hl(0, "TSException", { link = "TSKeyword" })
  vim.api.nvim_set_hl(0, "TSKeywordReturn", { link = "TSKeyword" })
  vim.api.nvim_set_hl(0, "TSKeywordFunction", { link = "TSKeyword" })
  vim.api.nvim_set_hl(0, "TSKeywordOperator", { link = "TSKeyword" })
  vim.api.nvim_set_hl(0, "TSVariableBuiltin", { link = "TSKeyword" })
  vim.api.nvim_set_hl(0, "TSConstBuiltin", { link = "TSKeyword" })
  vim.api.nvim_set_hl(0, "TSConstructor", { link = "TSType" })
  vim.api.nvim_set_hl(0, "TSConstant", { fg = "#88C0D0" })

  vim.api.nvim_set_hl(0, "BufferOffset", { link = "BufferCurrent" })

  local presets = require("which-key.plugins.presets")
  presets.operators[">"] = nil
  require("which-key").setup({})

  require("notifier").setup({})
  -- require("notify").setup({
  --   background_colour = "#2E3440",
  -- })
  -- vim.notify = require("notify")
  -- require("telescope").load_extension("notify")

  local navic = require("nvim-navic")

  require("lualine").setup({
    options = {
      theme = "nord",
      section_separators = { "", "" },
      component_separators = { "|", "|" },
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {},
      lualine_c = { { navic.get_location, cond = navic.is_available } },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "branch", "diff", "diagnostics" },
      lualine_z = { "progress", "location" },
    },
    extensions = {
      "nvim-tree",
      "quickfix",
      "toggleterm",
    },
  })

  -- require("feline").setup({})

  require("indent_blankline").setup({
    char = "▏",
    space_char_blankline = " ",
    buftype_exclude = { "terminal" },
    filetype_exclude = { "alpha" },
  })
  -- fix https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
  vim.opt.colorcolumn = "99999"

  vim.g.bufferline = {
    exclude_ft = { "qf" },
    exclude_name = {},

    icons = "both",
    icon_separator_active = " ",
    icon_separator_inactive = " ",
    icon_close_tab = "",
    icon_close_tab_modified = "●",
    icon_pinned = "車",
    letters = "qsdfjklghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
    maximum_padding = 2,
  }

  require("colorizer").setup()

  vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
      if vim.bo.filetype == "NvimTree" then
        require("bufferline.api").set_offset(41, "FileTree")
      end
    end,
  })

  vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*",
    callback = function()
      if vim.fn.expand("<afile>"):match("NvimTree") then
        require("bufferline.api").set_offset(0)
      end
    end,
  })

  require("zen-mode").setup({})
end

function ui.bindings(map)
  local wk = require("which-key")

  wk.register({
    ["<leader>b"] = {
      name = "+Buffer",
      d = { "<cmd>confirm BufferClose<cr>", "Close current" },
      c = {
        name = "+Close",
        a = { "<cmd>bufdo :confirm BufferClose<cr>", "Close all" },
        p = {
          "<cmd>BufferCloseAllButPinned<cr>",
          "Close all but pinned",
        },
        c = {
          "<cmd>BufferCloseAllButCurrent<cr>",
          "Close all but current",
        },
        l = { "<cmd>BufferCloseBuffersLeft<cr>", "Close buffers left" },
        r = { "<cmd>BufferCloseBuffersRight<cr>", "Close buffers right" },
      },
      p = { "<cmd>BufferPin<cr>", "Pin buffer" },
      od = { "<cmd>BufferOrderByDirectory<CR>", "Sort by directory" },
      oe = { "<cmd>BufferOrderByLanguage<CR>", "Sort by language" },
    },
    ["<leader>u"] = {
      name = "+UI",
      z = { "<cmd>ZenMode<cr>", "Toggle Zen mode" },
    },
  })

  local opts = { noremap = true, silent = true }

  map("n", "<A-Left>", ":BufferPrevious<CR>", opts)
  map("n", "<A-Right>", ":BufferNext<CR>", opts)
  map("n", "<A-j>", ":BufferPrevious<CR>", opts)
  map("n", "<A-k>", ":BufferNext<CR>", opts)
  map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
  map("n", "<A->>", " :BufferMoveNext<CR>", opts)
  map("n", "<A-q>", ":confirm BufferClose<CR>", opts)
  map("n", "gh", ":BufferPick<CR>", opts)

  wk.register({
    ["<leader>"] = {
      ["&"] = {
        "<cmd>BufferGoto 1<cr>",
        "which_key_ignore",
      },
      ["é"] = {
        "<cmd>BufferGoto 2<cr>",
        "which_key_ignore",
      },
      ['"'] = {
        "<cmd>BufferGoto 3<cr>",
        "which_key_ignore",
      },
      ["'"] = {
        "<cmd>BufferGoto 4<cr>",
        "which_key_ignore",
      },
      ["("] = {
        "<cmd>BufferGoto 5<cr>",
        "which_key_ignore",
      },
      ["-"] = {
        "<cmd>BufferGoto 6<cr>",
        "which_key_ignore",
      },
      ["è"] = {
        "<cmd>BufferGoto 7<cr>",
        "which_key_ignore",
      },
      ["_"] = {
        "<cmd>BufferGoto 8<cr>",
        "which_key_ignore",
      },
      ["ç"] = {
        "<cmd>BufferGoto 9<cr>",
        "which_key_ignore",
      },
    },
  })

  map("n", "<c-Left>", ":<C-u>wincmd h<CR>", opts)
  map("n", "<c-Right>", ":<C-u>wincmd l<CR>", opts)
  map("n", "<c-Up>", ":<C-u>wincmd k<CR>", opts)
  map("n", "<c-Down>", ":<C-u>wincmd j<CR>", opts)

  map("n", "<PageUp>", "<C-U>", {})
  map("n", "<PageDown>", "<C-D>", {})
  map("i", "<PageUp>", "<C-O><C-U>", {})
  map("i", "<PageDown>", "<C-O><C-D>", {})

  vim.cmd([[
    cnoreabbrev h vertical help
    cnoreabbrev qa confirm qa
    cnoreabbrev q confirm q
  ]])
end

return ui
