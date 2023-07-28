###########
# Aliases #
###########

alias la="ls -GlFha"

alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -S'
alias gd='git diff --word-diff'
alias go='git switch'
alias gp='git push'
alias gpl='git pull'
alias grpo='git remote prune origin --dry-run'
alias gplum='git pull upstream master'
alias gplom='git pull origin master'
alias grporun='git remote prune origin'
alias gm='git merge'
alias gl='git log --oneline --decorate --graph --all -10'
alias gld='git log --graph --pretty=format:"%C(auto)%h%Creset %C(cyan)%cs%Creset %s"'
alias g=git

# See https://macos-defaults.com
alias showFiles='defaults write com.apple.finder "AppleShowAllFiles" --bool "true" && killall Finder'
alias hideFiles='defaults write com.apple.finder "AppleShowAllFiles" --bool "false" && killall Finder'


#############
# Functions #
#############

manopt()
{
    if [[ $# -ne 2 ]]; then
        echo "Enter command name and option to search for."
    else
        man "$1" | less "+/ $2"
    fi
}

gbdp() {
    if [ -n "$1" ]; then
        git branch -D "$1"
        git push --delete origin "$1"
    fi
}

#review github pull request locally
#git fetch upstream pull/PULL_REQUEST_ID/head:CREATE_LOCAL_BRANCH
gpr() {
    if [ -n "$1" ]; then
        git fetch upstream pull/"$1"/head:pr
        git checkout pr
    fi
}
