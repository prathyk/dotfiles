source $HOME/.antigenrc
source ~/.zsh/aliases.zsh
source ~/.zsh/keybindings.zsh
# Lines configured by zsh-newuser-install
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

export FZF_DEFAULT_COMMAND='runcached.py -cd 3600 rg --files --no-ignore --hidden --follow --glob "!.git/*"'
#export FZF_DEFAULT_COMMAND='(runcached.py -cd 3600 git ls-tree -r --name-only HEAD || runcached.py -cd 3600 rg --files --no-ignore --hidden --follow --glob "!.git/*")'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
