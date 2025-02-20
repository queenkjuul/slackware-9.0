if fgrep zsh etc/shells 1> /dev/null 2> /dev/null; then
 true
else
 echo "/bin/zsh" >> etc/shells
fi
( cd etc ; rm -rf zprofile )
( cd etc ; ln -sf  profile zprofile )
