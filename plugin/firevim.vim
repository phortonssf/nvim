
"FireNVIM
if exists('g:started_by_firenvim')
  set laststatus=0 
  let mapleader = "\<Space>"
  "au BufEnter :AirlineToggle<CR>
  set columns=100
  autocmd vimenter * :AirlineToggle <CR>
  au BufEnter github.com_*.txt set filetype=markdown 
  "set laststatus=0
"DISABLE AIRLINE IN FIRENVIM
  let g:airline_section_b = ''
  let g:airline_section_c = ''
  let g:airline_section_y = ''
  
  let g:airline_section_z = ''
  
  set guifont=CaskaydiaCove\ NF:h18
  
  " let g:airline#extensions#tabline#enabled = 0
  " let airline#extensions#tabline#show_buffers = 0
  
  let g:firenvim_config = {
    \ 'globalSettings': {
        \ '<C-w>': 'noop',
        \ '<C-n>': 'default',
    \ 'ignoreKeys': {
        \ 'all': ['<C-v>']
        \}
    \ }
\ }
  
else
  set laststatus=2
endif
function! s:IsFirenvimActive(event) abort
  if !exists('*nvim_get_chan_info')
    return 0
  endif
  let l:ui = nvim_get_chan_info(a:event.chan)
  return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
      \ l:ui.client.name =~? 'Firenvim'
endfunction 

" function! OnUIEnter(event) abort
"   if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
"     set wrap linebreak nolist
"     set laststatus=0
"     set lines=30
"     set columns=100
"   endif
" endfunction
function! OnUIEnter(event) abort
  if s:IsFirenvimActive(a:event)
   " autocmd VimResized * :wincmd =
    set lines=20
    set columns=100
  endif
endfunction
