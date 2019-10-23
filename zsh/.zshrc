source ~/zshrc.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/functionDefs.zsh
# Lines configured by zsh-newuser-install
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

export EDITOR=/usr/bin/vim
export CHEATCOLORS=true


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && source ~/.fzf-extra.sh && source ~/.fzf-extra.zsh
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

export FZF_DEFAULT_OPTS="--bind 'f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | xclip)+abort'"
export FZF_DEFAULT_COMMAND='runcached.py -cd 3600 rg --files --no-ignore --hidden --follow --glob "!.git/*"'
#export FZF_DEFAULT_COMMAND='(runcached.py -cd 3600 git ls-tree -r --name-only HEAD || runcached.py -cd 3600 rg --files --no-ignore --hidden --follow --glob "!.git/*")'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PATH=$PATH:/opt/gradle/gradle-4.10.1/bin



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/osboxes/.sdkman"
[[ -s "/home/osboxes/.sdkman/bin/sdkman-init.sh" ]] && source "/home/osboxes/.sdkman/bin/sdkman-init.sh"

#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#    tmux attach -t default || tmux new -s default
#fi
