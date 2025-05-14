return {
  {
    "lewis6991/gitsigns.nvim",

    opts = function(_, opts)
      local parent_on_attach = opts.on_attach

      opts.on_attach = function(buffer)
        parent_on_attach(buffer)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", ")h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", ")H", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")
      end

      return opts
    end,
  },
}
