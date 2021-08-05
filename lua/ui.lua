   local layer = {}

layer.plugins = function(use)
    use 'arcticicestudio/nord-vim'
    use 'hoob3rt/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use "lukas-reineke/indent-blankline.nvim"
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
    	end
    }
    use 'romgrk/barbar.nvim'
end

layer.setup = function()
    vim.cmd [[colorscheme nord]]
    require('lualine').setup {
        options = {
            theme = 'nord'
        }
    }

    vim.g.indent_blankline_char = '▏'

    vim.g.bufferline = {
        animation = false,
        --  exclude_ft = ['javascript'],
        --  exclude_name = ['package.json'],
    }

    vim.cmd [[hi! link BufferCurrentMod BufferCurrent]]
    vim.cmd [[hi! link BufferInactivetMod BufferInactive]]
end

layer.bindings = function()
    local wk = require("which-key")
    
    wk.register({
        ["<leader>b"] = {
            name = "+Buffer",
            d = { "<cmd>BufferClose<cr>", "Close current" },
            D = { "<cmd>BufferClose!<cr>", "Force close current" },
            C = { "<cmd>bufdo :BufferClose<cr>", "Close all" },
            c = { "<cmd>BufferCloseAllButCurrent<cr>", "Close all but current" },
            L = { "<cmd>BufferCloseBuffersLeft<cr>", "Close buffers left" },
            R = { "<cmd>BufferCloseBuffersRight<cr>", "Close buffers right" },
            p = { "<cmd>BufferPick<cr>", "Pick buffer" },
            od = { '<cmd>BufferOrderByDirectory<CR>', "Sort by directory" },
            ol = { '<cmd>BufferOrderByLanguage<CR>', "Sort by language" },
        },
    })

    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map('n', '<A-Left>', ':BufferPrevious<CR>', opts)
    map('n', '<A-Right>', ':BufferNext<CR>', opts)
    map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
    map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
    map('n', '<A-c>', ':BufferClose<CR>', opts)

    wk.register({
        ["<leader>"] = {
            ["&"] = { "<cmd>BufferGoto 1<cr>", "which_key_ignore" },
            ["é"] = { "<cmd>BufferGoto 2<cr>", "which_key_ignore"},
            ["\""] = { "<cmd>BufferGoto 3<cr>", "which_key_ignore" },
            ["'"] = { "<cmd>BufferGoto 4<cr>", "which_key_ignore" },
            ["("] = { "<cmd>BufferGoto 5<cr>", "which_key_ignore" },
            ["-"] = { "<cmd>BufferGoto 6<cr>", "which_key_ignore" },
            ["è"] = { "<cmd>BufferGoto 7<cr>", "which_key_ignore" },
            ["_"] = { "<cmd>BufferGoto 8<cr>", "which_key_ignore" },
            ["ç"] = { "<cmd>BufferGoto 9<cr>", "which_key_ignore" },
            ["à"] = { "<cmd>BufferLast<cr>", "which_key_ignore" }
        },
    })
end

return layer

