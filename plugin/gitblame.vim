if exists('g:loaded_gitblame')
    finish
endif
let g:loaded_gitblame = 1

command! -nargs=0 GitBlame call gitblame#echo()

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
