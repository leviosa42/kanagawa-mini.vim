# :ocean: kanagawa-mini.vim :ocean:

A minimal color scheme ported from [rebelot/kanagawa.nvim] for Vim.

This color scheme defines only the highlight groups described in :h highlight-groups and :h group-names.

## Installation

### vim-plug

```vim
Plug 'leviosa42/kanagawa-mini'
```

### dein.vim

```vim
call dein#add('leviosa42/kanagawa-mini')
```

### manually...

```shell
$ mkdir -p ~/.vim/colors
$ cd ~/.vim/colors
$ curl https://raw.githubusercontent.com/leviosa42/kanagawa-mini.vim/master/colors/kanagawa-mini.vim -o kanagawa-mini.vim
```

## Usage

```vim
colorscheme kanagawa-mini
```

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
[vim-plug]: https://github.com/junegunn/vim-plug
