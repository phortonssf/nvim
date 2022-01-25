
" MAP dd delete line in quickfix list;
" SOURCE: https://stackoverflow.com/questions/42905008/quickfix-list-how-to-add-and-remove-entries
noremap <buffer> <silent> dd
  \ <Cmd>call setqflist(filter(getqflist(), {idx -> idx != line('.') - 1}), 'r') <Bar> cc<CR>
