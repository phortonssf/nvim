
" nnoremap <leader>rr :lua require('digitaldive.telescope').refactors()<CR>
" vnoremap <leader>rr :lua require('digitaldive.telescope').refactors()<CR>
" nnoremap <leader>td :lua require('digitaldive.telescope').dev()<CR>
" nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
" nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

nnoremap <leader>tfb :Telescope file_browser<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ prompt_title = string.format("Search For (%s)", vim.loop.cwd()), hidden = true, search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { prompt_title = string.format("Search (%s)", vim.loop.cwd()), search = vim.fn.expand("<cword>") }<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files({ prompt_title = string.format("Find Files (%s)", vim.loop.cwd()) })<CR>
" nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
" nnoremap <Leader>pf :lua require("telescope.builtin").find_files({ prompt_title = string.format("Find Files (%s)", require("plenary.path"):new(vim.loop.cwd()):shorten()) })
nnoremap <Leader>pf  :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('digitaldive.telescope').search_dotfiles()<CR>
nnoremap <leader>va :lua require('digitaldive.telescope').anime_selector()<CR>
nnoremap <leader>vc :lua require('digitaldive.telescope').chat_selector()<CR>
nnoremap <leader>gb :lua require('digitaldive.telescope').git_branches()<CR>
nnoremap <leader>rf :lua require('telescope.builtin').oldfiles()<CR>
" search only key maps
nnoremap <leader>skb :lua require("telescope.builtin").live_grep({search_dirs = {"~/.dotfiles/nvim/.config/nvim/plugin"}})<CR>

" search only cached get repos in $HOME, update cache with updatedb, use locate
" nnoremap <leader>gr :Telescope repo cached_list <CR>
" nnoremap <leader>gr :lua require'telescope'.extensions.repo.cached_list{prompt_title = string.format("GIT REPO"), fd_opts = { '/home/digitaldive/projects'}}<CR>
nnoremap <leader>gr :lua require'telescope'.extensions.repo.cached_list{file_ignore_patterns={"^".. vim.env.HOME .. "/%.esy/","^".. vim.env.HOME .. "/%.local/","^".. vim.env.HOME .. "/%.nvm/","^".. vim.env.HOME .. "/%.cache/", "^".. vim.env.HOME .. "/%.config/","^".. vim.env.HOME .. "/%.cargo/"}}<CR><CR>


