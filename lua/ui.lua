local ui = {}

function ui.plugins(use)
  -- use("arcticicestudio/nord-vim")
  use("shaunsingh/nord.nvim")
  use("nvim-lualine/lualine.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("lukas-reineke/indent-blankline.nvim")
  use("folke/which-key.nvim")
  use("romgrk/barbar.nvim")
  use("famiu/bufdelete.nvim")
  use("norcalli/nvim-colorizer.lua")
  use("rcarriga/nvim-notify")
  use("SmiteshP/nvim-gps")
end

function ui.setup()
  vim.g.nord_borders = true
  require("nord").set()

  vim.highlight.create("Search", { guifg = "NONE", guibg = "#4C566A", gui = "NONE" }, false)
  vim.highlight.create("FloatBorder", { guifg = "#3B4252" }, false)
  vim.highlight.create("MatchParen", { guifg = "NONE", guibg = "#4C566A" }, false)
  vim.highlight.create("Identifier", { guifg = "#D8DEE9" }, false)
  vim.highlight.create("qfLineNr", { guifg = "#88C0D0", gui = "NONE" }, false)

  vim.highlight.link("TSParameter", "Identifier", true)
  vim.highlight.create("TSProperty", { guifg = "#D8DEE9" })
  vim.highlight.create("TSType", { guifg = "#8FBCBB" })
  vim.highlight.link("TSException", "TSKeyword", true)
  vim.highlight.link("TSKeywordReturn", "TSKeyword", true)
  vim.highlight.link("TSKeywordFunction", "TSKeyword", true)
  vim.highlight.link("TSKeywordOperator", "TSKeyword", true)
  vim.highlight.link("TSVariableBuiltin", "TSKeyword", true)
  vim.highlight.link("TSConstBuiltin", "TSKeyword", true)
  vim.highlight.link("TSConstructor", "TSType", true)
  vim.highlight.create("TSConstant", { guifg = "#88C0D0" }, false)

  require("which-key").setup({})

  require("notify").setup({})
  vim.notify = require("notify")

  require("nvim-gps").setup({
    icons = {
      ["container-name"] = " ", -- Containers (example: lua tables)
    },
  })
  local gps = require("nvim-gps")

  require("lualine").setup({
    options = {
      theme = "nord",
      section_separators = { "", "" },
      component_separators = { "|", "|" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {},
      lualine_c = { { gps.get_location, cond = gps.is_available } },
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
