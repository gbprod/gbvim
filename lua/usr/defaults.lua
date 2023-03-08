return function()
    vim.g.matchup_matchparen_offscreen = {}
    vim.g.textobj_comment_no_default_key_mappings = 1

    vim.cmd([[ let &clipboard = "unnamed,unnamedplus" ]])

    vim.diagnostic.config({
        float = {
            show_header = true,
            source = "always",
            border = "single",
            focusable = false,
        },
    })

    vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        callback = function()
            if vim.fn.filereadable(".project.lua") == 1 then
                vim.cmd("source .project.lua")
            end
        end,
    })
end
