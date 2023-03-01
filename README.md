## :ocean: kanagawa-mini.vim :ocean:

A minimal color scheme ported from [rebelot/kanagawa.nvim] for Vim.

This color scheme defines only the highlight groups described in :h highlight-groups and :h group-names.

## Configure

```vim
" Default options:
let g:kanagawa_mini = {
    \ 'undercurl': v:true,
    \ 'commentStyle': 'italic',
    \ 'functionStyle': 'NONE',
    \ 'keywordStyle': 'italic',
    \ 'statementStyle': 'bold',
    \ 'typeStyle': 'NONE',
    \ 'specialReturn': v:true,
    \ 'specialExeption': v:true,
    \ 'transparent': v:false,
    \ 'dimInactive': v:false,
    \ 'terminalColors': v:true,
    \ 'theme': 'default'
    \ }
```

## License

[MIT license](/LICENSE)

## Acknowledgements

- [rebelot/kanagawa.nvim]

<!-- links -->
[rebelot/kanagawa.nvim]: https://github.com/rebelot/kanagawa.nvim
