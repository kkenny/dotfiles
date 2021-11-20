export EDITOR=vim
export VISUAL=vim

# vi bindings for shell
set -o vi

source ~/.bash_functions

PROMPT="%B%F{9}%n%f%b@%B%F{9}%m%f%b %B%K{237}%F{33}%h%f%k%b%K{231}%F{231} : %f%k%B%K{231}%F{241}%?%f%k%b%K{231} : %k%B%K{232}%F{33}%~%f%k%b > `parse_git_branch` %"

echo ".zshrc sourced"
