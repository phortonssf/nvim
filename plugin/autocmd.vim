"Go to Insert mark across buffers https://stackoverflow.com/questions/28014665/how-to-go-to-the-last-edit-location-across-all-buffers-in-vim

"let g:detect_mod_reg_state = -1
"function! DetectRegChangeAndUpdateMark()
"    let current_small_register = getreg('"-')
"    let current_mod_register = getreg('""')
"    if g:detect_mod_reg_state != current_small_register || 
"                \ g:detect_mod_reg_state != current_mod_register
"        normal! mM
"        let g:detect_mod_reg_state = current_small_register
"    endif
"endfunction
"
"" Mark I at the position where the last Insert mode occured across the buffer
"autocmd InsertLeave * execute 'normal! mI'
"
"" Mark M at the position when any modification happened in the Normal or Insert mode
"autocmd CursorMoved * call DetectRegChangeAndUpdateMark()
"autocmd InsertLeave * execute 'normal! mM'
