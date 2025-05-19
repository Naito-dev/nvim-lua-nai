

vim.cmd [[

let mapleader = " "

nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprevious<CR>
nnoremap <leader>q :Bdelete<CR>

nnoremap <silent> <leader>e :NvimTreeFocus<CR>
nnoremap <silent> <C-n> :NvimTreeClose<CR>
nnoremap <silent> <leader>f :NvimTreeFindFile<CR>

nmap <C-s> :w!<CR>
nnoremap <C-q> :q!<CR>

" Comando para abrir terminal pequeno no rodapé
command! TermBottom belowright split | resize 10 | terminal
nnoremap <silent> <leader>h :TermBottom<CR>
" No modo terminal, mapear <Esc> para sair para modo normal
tnoremap <Esc> <C-\><C-n>

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

















"JAVA COMPILER
function! CompileAndRunJava()
  write
  call system('mkdir -p out')
  let l:compile_cmd = 'javac -d out $(find src -name "*.java")'
  let l:compile_output = system(l:compile_cmd)
  if v:shell_error != 0
    echohl ErrorMsg
    echo "Erro na compilação:"
    echo l:compile_output
    echohl NONE
    return
  endif
  let l:class_name = expand('%:t:r')
  let l:package_line = matchstr(join(getline(1, 10), "\n"), '^\s*package\s\+\zs\S\+\ze\s*;')
  if !empty(l:package_line)
    let l:full_class = l:package_line . '.' . l:class_name
  else
    let l:full_class = l:class_name
  endif
  let l:term_bufnr = -1
  for w in range(1, winnr('$'))
    if getwinvar(w, '&buftype') ==# 'terminal'
      let l:term_bufnr = winbufnr(w)
      execute w . 'wincmd w'
      break
    endif
  endfor
  if l:term_bufnr == -1
    belowright split
    resize 10
    terminal
  else
    execute "buffer " . l:term_bufnr
  endif
  call jobsend(b:terminal_job_id, "java -cp out " . l:full_class . "\n")
  startinsert
endfunction
"=============================================================================
" JAVASCRIPT RUNNER
function! RunJavaScript()
  write
  let l:filename = expand('%:p')
  let l:term_bufnr = -1

  " Verifica se já existe um terminal aberto
  for w in range(1, winnr('$'))
    if getwinvar(w, '&buftype') ==# 'terminal'
      let l:term_bufnr = winbufnr(w)
      execute w . 'wincmd w'
      break
    endif
  endfor

  " Abre terminal se necessário
  if l:term_bufnr == -1
    belowright split
    resize 10
    terminal
  else
    execute "buffer " . l:term_bufnr
  endif

  " Envia o comando para rodar com Node
  call jobsend(b:terminal_job_id, "node " . l:filename . "\n")
  startinsert
endfunction

function! RunDependingOnFiletype()
  if &filetype ==# 'java'
    call CompileAndRunJava()
  elseif &filetype ==# 'javascript'
    call RunJavaScript()
  else
    echo "Tipo de arquivo não suportado"
  endif
endfunction




nnoremap <leader>r :call RunDependingOnFiletype()<CR>
]]
