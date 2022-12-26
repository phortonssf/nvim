" copy visiual selection and add filepath/name to top
function! functions#CompleteYank()
	redir @n | silent! :'<,'>number | redir END
	let filename=expand("%")
	let decoration=repeat('-', len(filename)+1)
	let @*=decoration . "\n" . filename . ':' . "\n" . decoration . "\n" . @n
endfunctio

function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")

  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

function! functions#ToggleQF() abort
	for i in range(1, winnr('$'))
        if getbufvar(winbufnr(i), '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

	if getqflist() == []
		echo "qf list empty"
		return
	endif
	copen
endfunction
