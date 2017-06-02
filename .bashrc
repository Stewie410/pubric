#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Env vars
# Shell prompt
PS1='[\u@\h \W]\$ '

# even-better-ls colors
LS_COLORS=$(ls_colors_generator)

# Aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
