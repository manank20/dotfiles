" core.vim
" Basic Options
set background=dark
set clipboard=unnamedplus
set colorcolumn=85
set completeopt=noinsert,menuone,noselect
set cursorline
set guifont=Fira\ Code\ Light:h14
set hidden
set inccommand=split
set mouse=a
set number
" set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tab settings
set expandtab
set shiftwidth=4
set tabstop=4

filetype plugin indent on
syntax on

function! Formatonsave()
  let l:formatdiff = 1
  pyf /home/manank/.config/nvim/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp,*.c call Formatonsave()


" Custom filetype definitions
au BufRead,BufNewFile *.ll set filetype=llvm
au BufRead,BufNewFile *.s set filetype=asm
set t_Co=256

" Fedora-specific autocommands (e.g. load a spec file template)
augroup Fedora
 autocmd!
 autocmd BufNewFile *.spec silent! 0read /usr/share/nvim/template.spec
augroup END

" Neovide settings
let g:neovide_scale_factor = 1.0
let g:neovide_fullscreen = v:true
let g:neovide_cursor_trail_length = 4.8
let g:neovide_cursor_animation_length = 0.05
let g:neovide_refresh_rate = 144


" Session settings
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" Function to change scale factor (Neovide)
function! ChangeScaleFactor(delta)
 let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
endfunction
nnoremap <expr><C-=> ChangeScaleFactor(1.25)
nnoremap <expr><C--> ChangeScaleFactor(1/1.25)

" Custom command definitions
command Push !rsync -rav --delete --filter=':- .gitignore' . bus-wifi-mwm:/garage/workspace/test/wifi-mwm/
command -nargs=1 GitPush !git push origin HEAD:refs/for/<args>

" Folding settings using treesitter
set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
