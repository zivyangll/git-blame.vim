if exists('g:loaded_gitblame')
    finish
endif

command! -nargs=0 GitBlame call gitblame#echo()

nnoremap <Leader>s(git-blame-info) :<C-u>call gitblame#echo()<CR>

