local ui = {}

function ui.plugins(use)
  use("~/workspace/nord.nvim")
  use("nvim-lualine/lualine.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("lukas-reineke/indent-blankline.nvim")
  use("lukas-reineke/virt-column.nvim")
  use("folke/which-key.nvim")
  -- use("sunjon/Shade.nvim")
  use("famiu/bufdelete.nvim")
  use("NvChad/nvim-colorizer.lua")
  use("vigoux/notifier.nvim")
  use("SmiteshP/nvim-navic")
  use("romgrk/barbar.nvim")
  use("Isrothy/lualine-diagnostic-message")
  -- use({ "akinsho/bufferline.nvim", tag = "v3.*" })
  use("utilyre/barbecue.nvim")
  use("petertriho/nvim-scrollbar")
  use("folke/zen-mode.nvim")
end

function ui.setup()
  require("nord").setup({
    diff = { mode = "fg" },
    borders = true,
    errors = { mode = "fg" },
    colorblind = {
      enable = false,
      preserve_background = true,
      severity = {
        protan = 0,
        deutan = 1,
        tritan = 1,
      },
    },
    styles = {
      comments = { italic = false },
      keywords = {},
      functions = {},
      variables = {},
      bufferline = {
        current = { bold = false },
        modified = { bold = false, italic = true },
      },
    },
  })
  vim.cmd("colorscheme nord")

  local presets = require("which-key.plugins.presets")
  presets.operators[">"] = nil
  require("which-key").setup({})

  -- require("notify").setup({ level = vim.log.levels.TRACE })
  -- vim.notify = require("notify")
  require("notifier").setup({})

  -- require("shade").setup({})
  -- vim.api.nvim_create_user_command("ShadeToggle", function()
  --   require("shade").toggle()
  -- end, {})

  local navic = require("nvim-navic")
  navic.setup({
    highlight = true,
  })

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
      lualine_c = { "diagnostic-message" },
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

  require("colorizer").setup({
    user_default_options = {
      names = false,
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

  require("virt-column").setup()

  -- vim.opt.termguicolors = true
  -- require("bufferline").setup({
  --   options = {
  --     numbers = "ordinal",
  --     diagnostics = "nvim_lsp",
  --     separator_style = "thick",
  --   },
  --   highlights = require("nord.plugins.bufferline").akinsho(),
  -- })

  require("bufferline").setup({
    exclude_ft = { "qf" },
    exclude_name = {},
    icons = "both",
    icon_separator_active = "▎",
    icon_separator_inactive = "▎ ",
    letters = "qsdfjklghnmxcvbziowerutyqpQSDFJKLGHNMXCVBZIOWERUTYQP",
    maximum_padding = 2,
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
      [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
      [vim.diagnostic.severity.INFO] = { enabled = true, icon = " " },
      [vim.diagnostic.severity.HINT] = { enabled = true, icon = " " },
    },
  })

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

  require("barbecue").setup({
    exclude_filetypes = { "gitcommit", "toggleterm", "gitrebase" },
  })
  require("scrollbar").setup()
  require("scrollbar.handlers.gitsigns").setup()
  require("scrollbar.handlers.search").setup({})

  require("zen-mode").setup()
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
  map("n", "gh", ":BufferPick<CR>", { noremap = true, silent = true, desc = "Pick buffer" })

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
