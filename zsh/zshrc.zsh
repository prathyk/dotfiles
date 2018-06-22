source ~/.zplug/init.zsh

###zplug plugins


zplug "zdharma/fast-syntax-highlighting"
zplug "molovo/tipz"
zplug "laurenkt/zsh-vimto"
zplug "gradle/gradle-completion"
# Also prezto
zplug "sorin-ionescu/prezto", as:plugin, use:init.zsh, hook-build:"ln -s $ZPLUG_ROOT/repos/sorin-ionescu/prezto ${ZDOTDIR:-$HOME}/.zprezto"

zstyle ':prezto:*:*' color 'yes'

zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'fasd' \
  'tmux' \
  'git' \
  'docker' \
  'archive' \
  'autosuggestions' \
  'command-not-found' \
  'fasd' \
  'tmux' \
  'history-substring-search' \
  'prompt'

zstyle ':prezto:module:tmux:auto-start' remote 'yes'
zstyle ':prezto:module:git:alias' skip 'yes'
zstyle ':prezto:module:tmux:auto-start' local 'no'
# zstyle ':prezto:module:prompt' theme 'pure'
zstyle ':prezto:module:prompt' theme 'sorin'




zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:editor' dot-expansion 'yes'
# To indicate when the editor is in the primary keymap (emacs or viins), add the following to your theme_prompt_setup function.
zstyle ':prezto:module:editor:info:keymap:primary' format '>>>'

# To indicate when the editor is in the primary keymap (emacs or viins) insert mode, add the following to your theme_prompt_setup function.
zstyle ':prezto:module:editor:info:keymap:primary:insert' format 'I'

# To indicate when the editor is in the primary keymap (emacs or viins) overwrite mode, add the following to your theme_prompt_setup function.
zstyle ':prezto:module:editor:info:keymap:primary:overwrite' format 'O'

# To indicate when the editor is in the alternate keymap (vicmd), add the following to your theme_prompt_setup function.
zstyle ':prezto:module:editor:info:keymap:alternate' format '<<<'

# To indicate when the editor is completing, add the following to your theme_prompt_setup function.
zstyle ':prezto:module:editor:info:completing' format '...'



#zplug self update
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

bindkey "\eOP" run-help

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

