let s:save_cpo = &cpo
set cpo&vim

if has('nvim-0.3.2')
    let b:GBlameVirtualTextCounter = 0
    let g:GBlameVirtualTextEnable = get(g:, 'GBlameVirtualTextEnable', 0)
    let g:GBlameVirtualTextPrefix = get(g:, 'GBlameVirtualTextPrefix', '> ')
    let g:GBlameVirtualTextDelay  = get(g:, 'GBlameVirtualTextDelay', 2000)
 else
    let g:GBlameVirtualTextEnable = 0
 endif

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
        return {'error': 'Not a git repository'}
    elseif l:shell_error
        return {'error': 'Unhandled error: '.git_blame[0]}
    endif

    let commit_hash = matchstr( git_blame[0], '^\^*\zs\S\+' )
    if commit_hash =~# '^0\+$'
        " not committed yet
        return {'error': 'Not Committed yet'}
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

    return {'author':author, 'author_mail': author_mail, 'author_time': author_time, 'commit_hash': commit_hash, 'summary': summary, 'timestamp': timestamp }
endfunction

function! gitblame#echo()
    let l:blank = ' '
    let l:file = expand('%')
    let l:line = line('.')
    let l:gb = gitblame#commit_summary(l:file, l:line)
    if has_key(l:gb, 'error')
        let l:echoMsg = '['.l:gb['error'].']'
    else
        let l:echoMsg = '['.l:gb['commit_hash'][0:8].'] '.l:gb['summary'] .l:blank .l:gb['author_mail'] .l:blank .l:gb['author'] .l:blank .'('.l:gb['author_time'].')'
    endif
    if (g:GBlameVirtualTextEnable)
       let l:ns = nvim_create_namespace('gitBlame'.b:GBlameVirtualTextCounter)
       let b:GBlameVirtualTextCounter = (b:GBlameVirtualTextCounter + 1)%50
       let l:line = line('.')
       let l:buffer = bufnr('')
       call nvim_buf_set_virtual_text(l:buffer, l:ns, l:line-1, [[g:GBlameVirtualTextPrefix.l:echoMsg, 'GBlameMSG']], {})
       call timer_start(g:GBlameVirtualTextDelay, { tid -> nvim_buf_clear_namespace(l:buffer, l:ns, 0, -1)})
    endif
    echo l:echoMsg
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
