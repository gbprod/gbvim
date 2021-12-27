return {
  plugins = function(use)
    use("arcticicestudio/nord-vim")
    use("nvim-lualine/lualine.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("lukas-reineke/indent-blankline.nvim")
    use("folke/which-key.nvim")
    use("akinsho/nvim-bufferline.lua")
    use("famiu/bufdelete.nvim")
    use("norcalli/nvim-colorizer.lua")
    use("rcarriga/nvim-notify")
  end,

  setup = function()
    vim.cmd("colorscheme nord")

    require("which-key").setup({})
    vim.notify = require("notify")

    vim.highlight.create("Search", { ctermfg = "6", ctermbg = "8", guifg = "#88C0D0", guibg = "#4C566A" }, false)

    require("lualine").setup({
      options = {
        theme = "nord",
        section_separators = { "", "" },
        component_separators = { "|", "|" },
      },
      sections = {
        lualine_x = {
          "encoding",
          "fileformat",
          "filetype",
          function()
            return string.match(vim.fn.getcwd(), "/([^/]*)$")
          end,
        },
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

    require("bufferline").setup({
      options = {
        numbers = function(opts)
          return string.format("%s", opts.raise(opts.ordinal))
        end,
        close_command = function(bufnum)
          require("bufdelete").bufdelete(bufnum, true)
        end,
        right_mouse_command = nil,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, _)
          return "(" .. count .. ")"
        end,
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", text_align = "left" },
        },
      },
    })

    require("colorizer").setup()
  end,

  bindings = function(map)
    local wk = require("which-key")

    wk.register({
      ["<leader>b"] = {
        name = "+Buffer",
        d = { "<cmd>Bdelete<cr>", "Close current" },
        D = { "<cmd>Bdelete!<cr>", "Force close current" },
        C = { "<cmd>bufdo :Bdelete<cr>", "Close all" },
        c = {
          "<cmd>BufferLineCloseRight<cr><cmd>BufferLineCloseLeft<cr>",
          "Close all but current",
        },
        L = { "<cmd>BufferLineCloseLeft<cr>", "Close buffers left" },
        R = { "<cmd>BufferLineCloseRight<cr>", "Close buffers right" },
        p = { "<cmd>BufferLinePick<cr>", "Pick buffer" },
        od = { "<cmd>BufferLineSortByDirectory<CR>", "Sort by directory" },
        oe = { "<cmd>BufferLineSortByExtension<CR>", "Sort by extension" },
      },
    })

    local opts = { noremap = true, silent = true }

    map("n", "<A-Left>", ":BufferLineCyclePrev<CR>", opts)
    map("n", "<A-Right>", ":BufferLineCycleNext<CR>", opts)
    map("n", "<A-j>", ":BufferLineCyclePrev<CR>", opts)
    map("n", "<A-k>", ":BufferLineCycleNext<CR>", opts)
    map("n", "<A-<>", ":BufferLineMovePrev<CR>", opts)
    map("n", "<A->>", " :BufferLineMoveNext<CR>", opts)
    map("n", "<A-q>", ":Bdelete<CR>", opts)

    wk.register({
      ["<leader>"] = {
        ["&"] = {
          '<cmd>lua require"bufferline".go_to_buffer(1)<cr>',
          "which_key_ignore",
        },
        ["é"] = {
          '<cmd>lua require"bufferline".go_to_buffer(2)<cr>',
          "which_key_ignore",
        },
        ['"'] = {
          '<cmd>lua require"bufferline".go_to_buffer(3)<cr>',
          "which_key_ignore",
        },
        ["'"] = {
          '<cmd>lua require"bufferline".go_to_buffer(4)<cr>',
          "which_key_ignore",
        },
        ["("] = {
          '<cmd>lua require"bufferline".go_to_buffer(5)<cr>',
          "which_key_ignore",
        },
        ["-"] = {
          '<cmd>lua require"bufferline".go_to_buffer(6)<cr>',
          "which_key_ignore",
        },
        ["è"] = {
          '<cmd>lua require"bufferline".go_to_buffer(7)<cr>',
          "which_key_ignore",
        },
        ["_"] = {
          '<cmd>lua require"bufferline".go_to_buffer(8)<cr>',
          "which_key_ignore",
        },
        ["ç"] = {
          '<cmd>lua require"bufferline".go_to_buffer(9)<cr>',
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
  end,
}
