
"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"                             

syntax on
set autoindent
set nocompatible
filetype plugin on
set path+=**
set wildmenu
set number
set relativenumber
set ignorecase
set listchars=eol:¬,tab:▶-
set list
set tabstop=4
set shiftwidth=4

"--- PLUGINS ---"
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
Plug 'HerringtonDarkholme/yats.vim'
Plug 'preservim/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'davidhalter/jedi-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', {'name':'dracula'}
call plug#end()

"--- THEMES ---"
colorscheme dracula
let g:airline_theme = 'dracula'
hi Normal ctermbg=None
"hi LineNr ctermbg=None
"hi NonText ctermbg=None

"--- SETTINGS ---"
let g:coc_disable_startup_warning = 1
let g:vimwiki_list=[{'path':'~/.local/vimwiki'}]

"--- MAPS ---"
nnoremap <C-e> :NERDTreeToggle<CR>:<Backspace><ESC>
inoremap <C-e> <ESC>:NERDTreeToggle<CR>:<Backspace><ESC>

" Reset colors for transparency after returning from Goyo
noremap <C-g> :Goyo<CR>:hi Normal ctermbg=None<CR>

"--- PRESENTATION ---"
autocmd VimEnter *.ppvt setl window=32

"--- SPECIAL CHARACTERS ---"
" <BS>           Backspace
" <Tab>          Tab
" <CR>           Enter
" <Enter>        Enter
" <Return>       Enter
" <Esc>          Escape
" <Space>        Space
" <Up>           Up arrow
" <Down>         Down arrow
" <Left>         Left arrow
" <Right>        Right arrow
" <F1> - <F12>   Function keys 1 to 12
" #1, #2..#9,#0  Function keys F1 to F9, F10
" <Insert>       Insert
" <Del>          Delete
" <Home>         Home
" <End>          End
" <PageUp>       Page-Up
" <PageDown>     Page-Down
" <bar>          the '|' character, which otherwise needs to be escaped '\|'

" command! <func name> <func body>

" JUMPER
"inoremap <Space><Space> <Esc>/<CR>4xs


" - - - N O O B - - - "
inoremap <Up>    NOOB
inoremap <Down>  STOP<Space>BEING<Space>STUPID
inoremap <Left>  NOOB
inoremap <Right> STOP<Space>BEING<Space>STUPID


"--- Set File Types ---"
autocmd BufNewFile,BufRead *.todo set filetype=todo
autocmd BufNewFile,BufRead *.tex  set filetype=latex
autocmd BufNewFile,BufRead *.py   set filetype=python
autocmd BufNewFile,BufRead *.h    set filetype=c
autocmd BufNewFile,BufRead *.c    set filetype=c


"--- Python ---"
autocmd FileType python noremap == <ESC>:w<CR>:!clear && python %<CR>

"--- C ---"
autocmd FileType c noremap == <ESC>:w<CR>:!clear && make<CR>

"--- HTML ---"
autocmd FileType html noremap == <ESC>:w<CR>:!clear && google-chrome %&<CR>


"--- FAVUNI ---"
inoremap =-=   ≡
inoremap ->>   →
inoremap tickk ✓
inoremap boxx  ☐
inoremap boxt  ☒
inoremap +-    ±
inoremap <--   ←
inoremap *(    ★
