let g:python3_host_prog = '/usr/bin/python3'

" In order for neovim to use installed plugins shared with vim
set runtimepath+=/usr/share/vim/vimfiles/
augroup Fedora
  autocmd!
  " RPM spec file template
  autocmd BufNewFile *.spec silent! 0read /usr/share/nvim/template.spec
augroup END

" vim: et ts=2 sw=2
" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

filetype plugin indent on
syntax on
au BufRead,BufNewFile *.ll set filetype=llvm
au BufRead,BufNewFile *.s set filetype=asm
set t_Co=256


call plug#begin()
    " Appearance
    " Plug 'vim-airline/vim-airline'
    Plug 'itchyny/lightline.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'

    " Completion / linters / formatters
    Plug 'neoclide/coc.nvim',  {'branch': 'release'}
    Plug 'plasticboy/vim-markdown'

    " Git
    Plug 'airblade/vim-gitgutter'
call plug#end()

"lua << EOF
" local catppuccin = require("catppuccin")

"-- configure it
"catppuccin.setup("")
"EOF
"

" Vim Script
let g:catppuccin_flavour = "macchiato"   "dusk  latte, frappe, macchiato, mocha"
colorscheme catppuccin

inoremap <C-v> <Esc>"+p
vnoremap <C-c> "+y

let g:lightline = {'colorscheme': 'catppuccin'}
let g:neovide_fullscreen=v:true
let g:neovide_cursor_trail_length=4.8

let g:neovide_cursor_animation_length=0.05
let g:neovide_refresh_rate=144
