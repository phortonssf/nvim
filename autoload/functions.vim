
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

" visual select value and create ExtractVariable from input prompt
" vnoremap <leader>re :call ExtractVariable()<cr>
" function! ExtractVariable()
"     let name = input("Variable name: ")
"     if name == ''
"         return
"     endif
"     normal! gv
"     exec "normal c" . name
"     exec "normal! O" . name . " = "
"     normal! $p
" endfunction
" copy visiual selection and add filepath/name to top
function! functions#CompleteYank()
	redir @n | silent! :'<,'>number | redir END
	let filename=expand("%")
	let decoration=repeat('-', len(filename)+1)
	let @*=decoration . "\n" . filename . ':' . "\n" . decoration . "\n" . @n
endfunction

" WIP convert list of items to SQL tuple
function! functions#ToTupleFun() range
	silent execute a:firstline . ',' . a:lastline . 'norm I"'
	silent execute a:firstline . ',' . a:lastline . 'norm A",'
	silent execute a:firstline . ',' . a:lastline . 'join'

	" lines are now joined, there is only one line
	silent execute 'norm $x'
	silent execute 'norm I('
	silent execute 'norm A)'

	" yank final text
	silent execute 'norm yy'
endfunction

" blink word under cursor
function! functions#BlinkWord(blinktime)
	let target_pat = '\c\%#'.@/
	let ring = matchadd('IncSearch', target_pat)
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	call matchdelete(ring)
	redraw
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

function! Gitblame()
  GitBlameCopyCommitURL
endfunction

function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()



" function! s:MarkCodeBlock() abort
"     " Add Markdown code-block delimiters to begin and end of current visual group.
"     call append(line("'<")-1, '```')
"     call append(line("'>"), '```')
" endfunction
" xnoremap m_ :<c-u>call <sid>MarkCodeBlock()<CR>
