return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", ")h", function()
            if vim.wo.diff then
              return ")H"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", ")G", function()
            if vim.wo.diff then
              return ")G"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          require("which-key").register({
            ["<leader>g"] = { name = "+Git" },
            ["<leader>gh"] = { name = "+Hunk" },
          })
          -- Actions
          map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>")
          map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>")
          map("n", "<leader>ghS", gs.stage_buffer)
          map("n", "<leader>ghu", gs.undo_stage_hunk)
          map("n", "<leader>ghR", gs.reset_buffer)
          map("n", "<leader>ghp", gs.preview_hunk)
          map("n", "<leader>gb", function()
            gs.blame_line({ full = false })
          end)
          map("n", "<leader>gB", function()
            gs.blame_line({ full = true })
          end)
          map("n", "<leader>gtb", gs.toggle_current_line_blame)
          map("n", "<leader>ghd", gs.diffthis)
          map("n", "<leader>ghD", function()
            gs.diffthis("~")
          end)
          map("n", "<leader>gtd", gs.toggle_deleted)

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
        preview_config = {
          border = "single",
        },
      })
    end,
  },
}
