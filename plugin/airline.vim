
" ******** Vim  Airline Configuration *******
 if exists('g:started_by_firenvim')
     
     " set laststatus=0
     " let g:airline#extensions#tabline#enabled = 0
     " let airline#extensions#tabline#show_buffers = 0

 else
  set laststatus=2
let g:tablineclosebutton = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#alt_sep = 1
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filenameg
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#current_first = 0
let g:airline#extensions#tabline#show_close_button = 1
let g:asyncrun_open = 8
let g:asyncrun_status = ''
"let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])



" hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
" hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
" hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

if !exists('g:airline_symbols')
   let  airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"

endif
" let g:airline_theme = 'gruvbox_material'
autocmd VimEnter * AirlineTheme gruvbox_material
