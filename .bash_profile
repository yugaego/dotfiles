##########
# Colors #
##########

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad # LS_COLORS with GNU ls
export PS1='\[\e[0;32m\]\u@\h:\[\e[0m\]\[\e[0;33m\]\w\n\$\[\e[0m\] '


#######
# Git #
#######

# https://github.com/git/git/blob/bfce02c22f3f1b0539686cabb69a637854448be3/contrib/completion/git-completion.bash
if [ -f ~/.git-completion.bash ]; then
    export GIT_COMPLETION_SHOW_ALL=1
    . ~/.git-completion.bash
fi

# https://github.com/git/git/blob/bfce02c22f3f1b0539686cabb69a637854448be3/contrib/completion/git-prompt.sh
if [ -f ~/.git-prompt.sh ]; then
    export GIT_PS1_SHOWDIRTYSTATE=1
    export PS1='\[\e[0;32m\]\u@\h:\[\e[0m\]\[\e[0;33m\]\w$(__git_ps1 " (%s)")\n\$\[\e[0m\] '
    . ~/.git-prompt.sh
fi


#############
# Variables #
#############

export GPG_TTY=$(tty)

export BASH_SILENCE_DEPRECATION_WARNING=1

export HOMEBREW_NO_AUTO_UPDATE=1

export PATH="$HOME/.cargo/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH"
