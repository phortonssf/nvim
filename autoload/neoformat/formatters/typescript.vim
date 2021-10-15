function! neoformat#formatters#typescript#enabled() abort
    return ['prettier_eslint', 'eslint']
endfunction

function! neoformat#formatters#{{ filetype }}#{{ formatter name }}() abort
    return {
        \ 'exe': 'prettier_eslint',
        \ 'args': ['-s 4', '-q'],
        \ 'stdin': 1
        \ }
endfunction

function! neoformat#formatters#prettier_eslint#eslint() abort
  return {'exe': eslint

