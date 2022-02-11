local ui = {}

function ui.plugins(use)
  use("arcticicestudio/nord-vim")
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
  vim.cmd("colorscheme nord")
  vim.highlight.create("Search", { ctermfg = "6", ctermbg = "8", guifg = "#88C0D0", guibg = "#4C566A" }, false)

  require("which-key").setup({})
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
    icon_separator_active = "▏",
    icon_separator_inactive = "▏",
    icon_close_tab = "",
    icon_close_tab_modified = "●",
    icon_pinned = "車",
    letters = "qsdfjklghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
    maximum_padding = 2,
  }

  vim.highlight.create("BufferCurrentMod", { ctermfg = "3", guifg = "#EBCB8B" }, false)
  vim.highlight.create("BufferCurrentIndex", { guifg = "#C8D0E0", guibg = "#2E3440" }, false)
  vim.highlight.create("BufferCurrentMod", { guifg = "#EBCB8B", guibg = "#2E3440", gui = "bold" }, false)
  vim.highlight.create("BufferCurrentSign", { guifg = "#88C0D0", guibg = "#2E3440" }, false)
  vim.highlight.create("BufferCurrentTarget", { guifg = "#D57780", guibg = "#2E3440", gui = "bold" }, false)
  vim.highlight.create("BufferVisible", { guifg = "#C8D0E0", guibg = "#2E3440" }, false)
  vim.highlight.create("BufferVisibleIndex", { guifg = "#C8D0E0", guibg = "#2E3440" }, false)
  vim.highlight.create("BufferVisibleMod", { guifg = "#EBCB8B", guibg = "#2E3440", gui = "bold" }, false)
  vim.highlight.create("BufferVisibleSign", { guifg = "#6C7A96", guibg = "#2E3440" }, false)
  vim.highlight.create("BufferVisibleTarget", { guifg = "#D57780", guibg = "#2E3440", gui = "bold" }, false)
  vim.highlight.create("BufferInactive", { guifg = "#6C7A96", guibg = "#353B49" }, false)
  vim.highlight.create("BufferInactiveIndex", { guifg = "#6C7A96", guibg = "#353B49" }, false)
  vim.highlight.create("BufferInactiveMod", { guifg = "#EBCB8B", guibg = "#353B49" }, false)
  vim.highlight.create("BufferInactiveSign", { guifg = "#6C7A96", guibg = "#353B49" }, false)
  vim.highlight.create("BufferInactiveTarget", { guifg = "#D57780", guibg = "#353B49", gui = "bold" }, false)

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
    ]])
end

return ui
