if [ -f ~/.bashrc ]; then
    . ~/.bashrc;
fi
export PATH=$HOME/.cargo/bin:/opt/local/bin:/opt/local/sbin:$PATH
export GPG_TTY=$(tty)
