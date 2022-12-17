"Go to Insert mark across buffers https://stackoverflow.com/questions/28014665/how-to-go-to-the-last-edit-location-across-all-buffers-in-vim

let g:detect_mod_reg_state = -1
function! DetectRegChangeAndUpdateMark()
    let current_small_register = getreg('"-')
    let current_mod_register = getreg('""')
    if g:detect_mod_reg_state != current_small_register ||
                \ g:detect_mod_reg_state != current_mod_register
        normal! mM
        let g:detect_mod_reg_state = current_small_register
    endif
endfunction

" Mark I at the position where the last Insert mode occured across the buffer
autocmd InsertLeave * execute 'normal! mI'

" Mark M at the position when any modification happened in the Normal or Insert mode
autocmd CursorMoved * call DetectRegChangeAndUpdateMark()
autocmd InsertLeave * execute 'normal! mM'
"Got to last edit"
" autocmd VimEnter * execute "normal \g;"

"End of buffer Transparent
autocmd VimEnter * hi EndOfBuffer guibg=NONE ctermbg=NONE

"Transparent Background"
autocmd VimEnter * highlight NonText guibg=none
autocmd VimEnter * highlight Normal guibg=none

"Strip Trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" highlight on yank
augroup YankHighlight
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end

" show relative numbers in current window, and absolute in inactive
autocmd WinEnter,FocusGained * :setlocal number relativenumber
autocmd WinLeave,FocusLost   * :setlocal number norelativenumber
 augroup HelpBuffer | au! filetype help only | augroup END
set clipboard+=unnamedplus
let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }
" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif

" open helpfiles in vertical split
augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
" Return to last edit position when opening files (You want this!)"
"
function! GoToLastEdit()
  if &ft =~ 'fugitive'
    return
  endif
  if line("'\"") > 0 && line("'\"") <= line("$") |
      exe "silent! normal! g`\"" |
  endif
endfunction
autocmd BufReadPost * call GoToLastEdit()
