" keybindings.vim
" Set the leader key
let mapleader = ";"

" Telescope-related mappings
nnoremap <leader>rr :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>
nnoremap <leader>ff :Telescope fd<CR>
nnoremap <leader>fw :Telescope grep_string<CR>
nnoremap <leader>fs :Telescope coc workspace_symbols<CR>
nnoremap <leader>fr :Telescope coc references_used<CR>
nnoremap <leader>re :Telescope resume<CR>
nnoremap <leader>gi :LazyGit<CR>
nnoremap <leader>h :Telescope oldfiles<CR>

" NERDTree toggle
nnoremap \n :NERDTreeToggle<CR>

" Quickfix navigation
nnoremap [q :cnext<CR>
nnoremap ]q :cprevious<CR>

" Outline toggle
nnoremap <leader>o :Outline<CR>

" Window navigation via Ctrl+{h,j,k,l}
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Clipboard mappings
inoremap <C-v> <Esc>"+p
vnoremap <C-c> "+y

" coc completion and navigation mappings
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "<Tab>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>qf  <Plug>(coc-fix-current)


function! CheckBackspace() abort
 let col = col('.') - 1
 return !col || getline('.')[col - 1] =~# '\s'
endfunction

if has('nvim')
 inoremap <silent><expr> <c-space> coc#refresh()
else
 inoremap <silent><expr> <c-@> coc#refresh()
endif

" Coc diagnostic/navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
 if CocAction('hasProvider', 'hover')
 call CocActionAsync('doHover')
 else
 call feedkeys('K', 'in')
 endif
endfunction

" Send current buffer/selection to pastebin
command -range=% PB :<line1>,<line2>w !curl -F c=@- pb

" Auto-update on text change
autocmd TextChanged,TextChangedI * silent! update

" Auto-close NERDTree tab if it’s the only window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


