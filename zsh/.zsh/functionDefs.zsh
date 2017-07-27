cheat () {
    cheatmd="$HOME/.cheat/"     
    FILE=$cheatmd$1
    if [ -f $FILE ]; then
       pandoc $FILE | lynx -stdin
    else
       vim $FILE
    fi
}
