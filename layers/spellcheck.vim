function layers#spellcheck#config() abort
  call add(g:extensions, 'coc-spell-checker')
  call add(g:extensions, 'coc-cspell-dicts')

  call coc#config('cSpell.language', 'en,fr')
  call coc#config('cSpellExt.enableDictionaries', ['french'])
  call coc#config('cSpell.enabledLanguageIds', [
        \ 'git-commit', 'javascript', 'javascriptreact',
        \ 'markdown', 'php', 'plaintext', 'notes', 'mail',
        \ 'text', 'typescript', 'typescriptreact'
        \ ])

  call coc#config('cSpell.languageSettings',
        \ [
          \ {
            \ "languageId": "python",
            \ "includeRegExpList": [
              \ "/#.*/",
              \ "/('''|\"\"\")[^\\1]+?\\1/g",
              \ "strings"
            \ ]
          \ },
          \ {
            \ "languageId": "javascript,typescript,javascriptreact,typescriptreact",
            \ "includeRegExpList": [
              \ "CStyleComment",
              \ "strings"
            \ ]
          \ },
          \ {
            \ "languageId": "php",
            \ "includeRegExpList": [
              \ "CStyleComment",
              \ "PhpHereDoc",
              \ "strings"
            \ ]
          \ },
        \ ])
endfunction
