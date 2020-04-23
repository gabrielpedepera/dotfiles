" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Default # of completions is 100, that's crazy.
let g:deoplete#max_list = 6

" Set minimum syntax keyword length.
let g:deoplete#auto_completion_start_length = 2

" Map standard Ctrl-N completion to Ctrl-Space
inoremap <C-Space> <C-n>
