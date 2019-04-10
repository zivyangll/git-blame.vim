let s:save_cpo = &cpo
set cpo&vim

function! s:has_vimproc()
  if !exists('s:exists_vimproc')
    try
      call vimproc#version()
      let s:exists_vimproc = 1
    catch
      let s:exists_vimproc = 0
    endtry
  endif
  return s:exists_vimproc
endfunction

function! s:system(str, ...)
  let command = a:str
  let input = a:0 >= 1 ? a:1 : ''

  if a:0 == 0
    let output = s:has_vimproc() ?
          \ vimproc#system(command) : system(command)
  elseif a:0 == 1
    let output = s:has_vimproc() ?
          \ vimproc#system(command, input) : system(command, input)
  else
    " ignores 3rd argument unless you have vimproc.
    let output = s:has_vimproc() ?
          \ vimproc#system(command, input, a:2) : system(command, input)
  endif

  return output
endfunction

function! gitblame#commit_summary(file, line)
    let git_blame = split(s:system('cd "$(dirname "'.a:file.'")"; git --no-pager blame "$(basename "'.a:file.'")" -L "$(basename "'.a:line.'")",+1 --porcelain'), "\n")
    let l:shell_error = s:has_vimproc() ? vimproc#get_last_status() : v:shell_error
    if l:shell_error && ( git_blame[0] =~# '^fatal: Not a git repository' || git_blame[0] =~# '^fatal: cannot stat path' )
       return 'Error: Not a git repository'
    elseif l:shell_error
       return 'Unhandled error: '.git_blame[0]
    endif

    let commit_hash = matchstr( git_blame[0], '^\^*\zs\S\+' )
    if commit_hash =~# '^0\+$'
        " not committed yet
        return ''
    endif

    let summary = ''
    for line in git_blame
        if line =~# '^summary '
            let summary = matchstr(line, '^summary \zs.\+$')
            break
        endif
    endfor

    let author = matchstr(git_blame[1], 'author \zs.\+$')
    let author_mail = matchstr(git_blame[2], 'author-mail \zs.\+$')
    let timestamp = matchstr(git_blame[3], 'author-time \zs.\+$')
    let author_time = strftime("%Y-%m-%d %X", timestamp)
    let blank = ' '

    return '['.commit_hash[0:8].'] '.summary .blank .author_mail .blank .author .blank .'('.author_time.')'
endfunction

function! gitblame#echo()
    let file = expand('%')
    let line = line('.')
    echo gitblame#commit_summary(file, line)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
