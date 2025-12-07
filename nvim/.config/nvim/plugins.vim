" plugins.vim
call plug#begin('~/.local/share/nvim/plugged')
" Alpha-nvim for the dashboard
Plug 'goolord/alpha-nvim'

" Appearance plugins
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'echasnovski/mini.nvim'
Plug 'navarasu/onedark.nvim'

" Utility plugins
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'hedyhli/outline.nvim'
Plug 'stevearc/oil.nvim'

" Completion, linters & formatters
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'plasticboy/vim-markdown'
Plug 'ThePrimeagen/harpoon', {'branch': 'harpoon2'}

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'ilan-schemoul/nvim-gerrit'

" Other utilities
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'kdheepak/lazygit.nvim'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
Plug 'boltlessengineer/bufterm.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'APZelos/blamer.nvim'

" Debugger 
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'

Plug 'swaits/lazyjj.nvim'

" arista
Plug 'augmentcode/augment.vim'

call plug#end()

let g:augment_workspace_folders = ['/garage/workspace/test/wifi-mwm-jj', '/garage/workspace/arista']

" Blamer plugin setting
let g:blamer_enabled = 1

" Gutentags configuration
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
" let g:gutentags_project_root = ['.git', 'Makefile']
" let g:gutentags_cache_dir = expand('~/.cache/tags')
" let g:gutentags_plus_switch = 1
" " let g:gutentags_ctags_executable = "/opt/homebrew/bin/ctags"
" let g:gutentags_generate_on_new = 1
" let g:gutentags_generate_on_missing = 1
" let g:gutentags_generate_on_write = 1
" let g:gutentags_generate_on_empty_buffer = 0
" let g:loaded_perl_provider = 0
" let g:gutentags_plus_nomap = 1
" let g:gutentags_cscope_tagfile = 'cscope.files'
" let g:gutentags_cscope_build_cmd = 'cscope -bqR'
let g:gutentags_ctags_exclude = [
         \ '*.git', '*.svg', '*.hg',
         \ '*/tests/*',
         \ 'build',
         \ 'dist',
         \ '*sites/*/files/*',
         \ 'bin',
         \ 'node_modules',
         \ 'bower_components',
         \ 'cache',
         \ 'compiled',
         \ 'docs',
         \ 'example',
         \ 'bundle',
         \ 'vendor',
         \ '*.md',
         \ '*-lock.json',
         \ '*.lock',
         \ '*bundle*.js',
         \ '*build*.js',
         \ '.*rc*',
         \ '*.json',
         \ '*.min.*',
         \ '*.map',
         \ '*.bak',
         \ '*.zip',
         \ '*.pyc',
         \ '*.class',
         \ '*.sln',
         \ '*.Master',
         \ '*.csproj',
         \ '*.tmp',
         \ '*.csproj.user',
         \ '*.cache',
         \ '*.pdb',
         \ 'tags*',
         \ 'cscope.*',
         \ '*.css',
         \ '*.less',
         \ '*.scss',
         \ '*.exe', '*.dll',
         \ '*.mp3', '*.ogg', '*.flac',
         \ '*.swp', '*.swo',
         \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
         \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
         \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
         \ ]




" (Lua-based plugins will be configured in lua/plugins-config.lua)
lua require('Comment').setup()
lua require("ibl").setup()
