
function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")

  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

function Log(word)
  let wordUnderCursor = expand("<cword>")
  echo wordUnderCursor
  echom a:word 
endfunction

function Logger(word)
  let wordUnderCursor = expand("<cword>")
  exe "norm!" "console.log(''," . wordUnderCursor ";<Esc>T(li"
endfunction

function! Undoline()
  let pos = getpos(".")
  let current = getline(pos[1])
  let chg = changenr()
  while changenr() > 0 && current ==# getline(pos[1])
    silent exec 'u'
  endwhile
  let old = getline(pos[1])

  while changenr() < chg
    silent exec 'redo'
  endwhile
  " undo if we jumped over a gap
  if changenr() > chg
    silent exec 'u'
  endif
  call setpos('.', pos)
  if old ==# current
    echo 'no change found'
  else
    call setline(pos[1], old)
  endif
endfunction
" Lets you use leader in CMD MODE
" https://vi.stackexchange.com/questions/7779/how-to-use-leader-in-a-normal-command
function! ExecuteLeader(suffix)
  let l:leader = get(g:,"mapleader","\\")

  if l:leader == ' '
    let l:leader = '1' . l:leader
  endif

  execute "normal ".l:leader.a:suffix
endfunction

command! -nargs=1 NormLead call ExecuteLeader(<f-args>)

" toggle line number
function! NumberToggle()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <leader>vln :call NumberToggle()<cr>
