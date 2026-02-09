return {
  {
    url = "https://codeberg.org/trevorhauter/gitportal.nvim",
    opts = {
      -- Permalink generation | Include current line in URL regardless of current mode
      always_include_current_line = false, -- bool

      -- Permalink generation | Always use the commit hash; otherwise use current branch/commit
      always_use_commit_hash_in_url = false, -- bool

      -- Custom browser command (default: automatically determined by GitPortal)
      browser_command = nil, -- (override only if necessary, not recommended)

      -- Remote to use when generating links (applies globally)
      default_remote = "origin",

      -- Map of remote urls to git providers
      -- (default: automatically determined by GitPortal, required for self hosted instances)
      -- Ex. {["remote_url"] = { provider = "gitlab", base_url = "https://customdomain.dev"}}
      git_provider_map = {
        ["ssh://git@gitlab.mdpt.io:32022/med/monorepo.git"] = {
          provider = "gitlab",
          base_url = "https://gitlab.mdpt.io/med/monorepo",
        },
      },

      -- Branch/commit handling when opening links in neovim
      switch_branch_or_commit_upon_ingestion = "never", -- "always" | "ask_first" | "never"
    },
  },
}
