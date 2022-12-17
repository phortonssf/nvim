

" use fuzzy matching for / and ?
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])


call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': wilder#popupmenu_renderer({
            \ 'highlighter': wilder#basic_highlighter(),
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ }),
      \ '/': wilder#wildmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ }),
      \ }))

" set wildcharm=<C-n>
call wilder#setup({
      \'modes': ['/',':', 'a' ],
      \ 'next_key': '<C-n>',
      \ 'previous_key': '<C-p>',
      \ 'accept_key': '<C-Space>',
      \ 'reject_key': '<Up>',
      \})
