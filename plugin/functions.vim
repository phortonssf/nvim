
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
