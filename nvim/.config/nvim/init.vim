set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set guicursor=
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif
