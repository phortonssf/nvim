
-- sets lower tmux-line styls in nvim
-- https://github.com/edkolev/tmuxline.vim
local result = vim.api.nvim_exec(
  [[
    let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '%R',
      \'c'    : [ '#{sysstat_mem} #[fg=blue]\ufa51#{upload_speed}' ],
      \'win'  : [ '#I', '#W' ],
      \'cwin' : [ '#I', '#W', '#F' ],
      \'x'    : [ "#[fg=blue]#{download_speed} \uf6d9 #{sysstat_cpu}" ],
      \'y'    : [ '%a' ],
      \'z'    : '#H #{prefix_highlight}'
      \}
    let g:tmuxline_separators = {
      \ 'left' : "\ue0bc",
      \ 'left_alt': "\ue0bd",
      \ 'right' : "\ue0ba",
      \ 'right_alt' : "\ue0bd",
      \ 'space' : ' '
    \}
  ]], false
)
