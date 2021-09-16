return {
  plugins = function(use)
    use("haya14busa/vim-asterisk")
  end,

  bindings = function(map)
    map("n", "*", "<Plug>(asterisk-z*)", {})
    map("n", "#", "<Plug>(asterisk-z#)", {})
    map("n", "g*", "<Plug>(asterisk-gz*)", {})
    map("n", "g#", "<Plug>(asterisk-gz#)", {})
  end,
}
