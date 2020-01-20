set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif
