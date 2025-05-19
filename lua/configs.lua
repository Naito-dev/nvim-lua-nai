vim.cmd([[

set termguicolors

set noswapfile
syntax on
filetype plugin indent on
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set hidden
set mouse=a
set number
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set relativenumber
set cursorline


if &term =~ "xterm"
  let &t_SI = "\e[6 q"  " Modo insert: linha vertical (I-beam)
  let &t_EI = "\e[2 q"  " Modo normal: bloco sólido
endif



" Tabs size
set tabstop=4              " Define o número de espaços para uma tabulação
set shiftwidth=4              " Define o número de espaços para cada nível de indentação automática
set expandtab               " Converte tabulações em espaços
set smartindent               " Habilita a indentação inteligente automática
]])
