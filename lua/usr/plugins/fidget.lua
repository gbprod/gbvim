return {
  {
    "j-hui/fidget.nvim",
    opts = {

      progress = {
        display = {
          done_icon = "✔",
          done_style = "Normal",
          progress_style = "Normal",
          group_style = "NotifierTitle",
          icon_style = "Question",
        },
      },

      notification = {
        override_vim_notify = true,
        configs = {
          default = {
            name = "Notifications",
            icon = "",
            group_style = "NotifierTitle",
            icon_style = "Special",
            annote_style = "Normal",
            debug_style = "NotifyDEBUGTitle",
            warn_style = "NotifyWARNTitle",
            error_style = "NotifyERRORTitle",
            debug_annote = " ",
            info_annote = " ",
            warn_annote = " ",
            error_annote = " ",
          },
        },
      },
      view = {
        icon_separator = " ",
        group_separator = "---",
        group_separator_hl = "Normal",
      },

      window = {
        normal_hl = "Normal",
      },
    },
  },
}
