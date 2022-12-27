" CWD to buffer director
function! ChangeToLocalDir()
  lchdir  %:p:h |
  ":help filename-modifiers lchdir  %:p:h
  echo  getcwd()
  return ''
endfunction
function! CdBufWorkingDir(...)
    if a:0 == 0
        let l:targetdir = expand("%:p:h")
    else
        if a:1[0] == "~"
            let l:targetdir = fnamemodify( bufname(str2nr(a:1[1:])), ":p:h" )
        else
            let l:targetdir = a:1
        endif
    endif

    execute "cd ". l:targetdir
    execute "cd .."
    echo getcwd()
endfunction
command! -nargs=* Cdbuf :call CdBufWorkingDir(<q-args>)
nnoremap <expr> _c CdBufWorkingDir()
" nnoremap <expr> _c ChangeToLocalDir()
function GitCommitInsert()
 execute "normal! i() \<Esc>"
 " execute ":call feedkeys('()')"
 execute "normal! ggF)"
 startinsert
endfunction
function GitSigns()
   let gstatus = get(b:,'gitsigns_status','')
   return gstatus
endfunction

