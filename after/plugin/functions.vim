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



function! ToggleQuickFix()
   if empty(filter(getwininfo(), 'v:val.quickfix'))
       copen
   else
       cclose
   endif
endfunction


" function! DeleteEmptyBuffers()
"     let [i, n; empty] = [1, bufnr('$')]
"     while i <= n
"         if bufexists(i) && bufname(i) == ''
"             call add(empty, i)
"         endif
"         let i += 1
"     endwhile
"     if len(empty) > 0
"         exe 'bdelete' join(empty)
"     endif
" endfunction
" sdfsadf"
" asdfsdaf
" nnoremap <silent> <leader>bb :call DeleteEmptyBuffers()<CR> | :norm! q!<CR>
fun! ExitBuffer()
    if len(getbufinfo({'buflisted':1})) > 1
        execute 'update | :confirm :bd'
    else
        execute 'update | quit'
    endif
endfun
nnoremap <silent> <leader>bb  :call ExitBuffer()<CR>

" https://vi.stackexchange.com/questions/27104/efficient-way-of-cleaning-up-the-buffer-list
" Wipe all deleted (unloaded & unlisted) or all unloaded buffers
