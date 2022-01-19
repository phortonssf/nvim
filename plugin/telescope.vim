
" nnoremap <leader>rr :lua require('digitaldive.telescope').refactors()<CR>
" vnoremap <leader>rr :lua require('digitaldive.telescope').refactors()<CR>
" nnoremap <leader>td :lua require('digitaldive.telescope').dev()<CR>
" nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
" nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('digitaldive.telescope').search_dotfiles()<CR>
nnoremap <leader>va :lua require('digitaldive.telescope').anime_selector()<CR>
nnoremap <leader>vc :lua require('digitaldive.telescope').chat_selector()<CR>
nnoremap <leader>gb :lua require('digitaldive.telescope').git_branches()<CR>
nnoremap <leader>rf :lua require('telescope.builtin').oldfiles()<CR>
