let g:python3_host_prog = '/usr/bin/python3'

" Include any additional runtime paths if needed
set runtimepath+=/usr/share/vim/vimfiles/

" Load core options and autocommands/etc.
source ~/.config/nvim/core.vim

" Load plugin manager + plugin definitions
source ~/.config/nvim/plugins.vim

" Load keybindings
source ~/.config/nvim/keybindings.vim

" Load Lua-based configurations (all advanced plugin setups are in plugins-config.lua)
lua require('plugins-config')

lua require('debugger-config')

