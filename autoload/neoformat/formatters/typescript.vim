let cwd = getcwd()
function! neoformat#formatters#typescript#enabled() abort
    return ['prettier-eslint', 'eslint', 'prettier']

endfunction

function! neoformat#formatters#typescript#prettier() abort
    return {
        \ 'exe': 'prettier --write **/*.ts',
        \ 'args': [],
        \ 'stdin': 1,
        \ 'try_node_exe': 1 
        \ }
endfunction

function! neoformat#formatters#prettier_eslint#eslint() abort
  return {'exe': eslint }
endfunction

