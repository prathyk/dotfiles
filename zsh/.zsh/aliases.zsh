
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


alias repo="cd /home/osboxes/dev/repo/repo1/prpc-platform"
alias learn="cd /media/sf_Windows/Learning/repo"
alias smarepo="cd /home/osboxes/dev/repo/repo1/chauv"
alias dm="sudo systemctl restart  DavMail.service"
export VISUAL=vim
export EDITOR="$VISUAL"
set -o vi


alias gbranch="git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'"

alias syncRules="./gradlew syncToRuleBaseAll -PdatabaseProperties=\"/home/osboxes/dev/repo/repo1/prpc-platform/myDB.properties\""
alias syncRulesMain="./gradlew syncToRuleBaseMain -PdatabaseProperties=\"/home/osboxes/dev/repo/repo1/prpc-platform/myDB.properties\""
