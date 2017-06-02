# File: ~/.bash_aliases
# Author: Alex Paarfus <rapaarfus139@gmail.com>
# Desc: Definition of some useful aliases in bash

# Some common shortcuts for file-/directory commands
# ls, la, lla, dir, vdir replaced with even-better-ls versions
alias l='ls'
#alias ls="ls-i --color=auto -w $(tput cols)"
#alias la="ls-i -a --color=auto -w $(tput cols)"
#alias ll="ls-i -l --color=auto -w $(tput cols)"
#alias lla='ls-i -la --color=auto'
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias lla='ls -la --color=auto'
#alias dir="dir-i --color=auto -w $(tput cols)"
#alias vdir="vdir-i --color=auto -w $(tput cols)"
alias grep='grep --color=auto'
alias ..='cd ..'

# Some common shortcuts for tools
alias j='jobs'
alias v='vim'
alias ric='rc -f ansi'
alias nf='neofetch --config ~/.config/neofetch/config --ascii'
alias nfi='neofetch --config ~/.config/neofetch/config --w3m'
alias uf='ufetch'
alias loc='locate'
alias cm='cmatrix -bsu 6'
alias cmc='cmatrix -bsu 6 -C'
alias pipes='pipes.sh'
alias ncmpcpp='ncmpcpp --config ~/.config/ncmpcpp/config'
alias rstmp='redshift -p'
alias xclip='xclip -selection c'
alias tb='nc termbin.com 9999'
alias wiki='arch-wiki'

# Some silly tools
alias cs='cowsay'
alias csf='fortune | cowsay'
alias csfl='fortune | cowsay | lolcat'
alias cf='cowfortune'
alias lc='lolcat'

# Aliases for Git(hub)
alias git='git --no-pager'
alias ga='git add'
alias gb='git branch -a --color'
alias gc='git commit'
alias gd='git diff --color'
alias gl='git log --pretty=oneline'
alias gs='git status'
alias gcl='git clone'
alias gco='git checkout'
alias gmv='git mv'
alias gps='git push'
alias grm='git rm'
alias gi='git init'

# Aliases for chmod
alias 000='chmod 000'
alias 600='chmod 600'
alias 644='chmod 644'
alias 755='chmod 755'

# Aliases for pacman & pacaur
alias pacman='sudo pacman'
alias psyu='sudo pacman -Syu'
alias psyyu='sudo pacman -Syyu'
alias psy='sudo pacman -Sy'
alias psyy='sudo pacman -Syy'
alias pin='sudo pacman -S'
alias prm='sudo pacman -R'
alias pcl='sudo pacman -Rsn'
alias psr='sudo pacman -Ss'
alias pq='sudo pacman -Q'
alias asyu='pacaur -Syu'
alias asyyu='pacaur -Syyu'
alias asy='pacaur -Sy'
alias asyy='pacaur -Syy'
alias ain='pacaur -S'
alias arm='pacaur -R'
alias acl='pacaur -Rsn'
alias asr='pacaur -Ss'
alias aq='pacaur -Q'
alias sy='sudo pacman -Sy && pacaur -Sy'
alias syy='sudo pacman -Syy && pacaur -Syy'
alias syu='sudo pacman -Syu && pacaur -Syu --noedit'
alias syyu='sudo pacman -Syyu && pacaur -Syu --noedit'
alias scc='sudo pacman -Scc && pacaur -Scc'

# Execute the last command as root
alias lr='sudo $(history -p \!\!)'

# Search for a process containing a given name
function pps() { ps aux | grep "$@" | grep -v 'grep'; }

# Curl utilities
# Cheat.sh -- https://cheat.sh
function cheat() { curl cheat.sh/$1; }

# Transfer.sh -- https://transfer.sh
function transfer() { 
	if [ $# -eq 0 ]; then
		echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
		return 1;
	fi
	tmpfile=$( mktemp -t transferXXX );
	if tty -s; then
		basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
		curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
	else
		curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
	fi
	cat $tmpfile;
	cat $tmpfile | xclip;
	rm -f $tmpfile;
}

# Ix.io -- https://ix.io
function ix() {
	local opts
	local OPTIND
	[ -f "$HOME/.netrc" ] && opts='-n'
	while getopts ":hd:i:n:" x; do
		case $x in
			h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;
			d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
			i) opts="$opts -X PUT"; local id="$OPTARG";;
			n) opts="$opts -F read:1=$OPTARG";;
		esac
	done
	shift $(($OPTIND - 1))
	[ -t 0 ] && {
		local filename="$1"
		shift
		[ "$filename" ] && {
			curl $opts -F f:1=@"$filename" $* ix.io/$id
			return
		}
		echo "^C to cancel, ^D to send."
	}
	curl $opts -F f:1='<-' $* ix.io/$id
}

# 0x0.st -- https://0x0.st
function 0x0() {
	if [[ $1 -eq 0 ]]; then
		curl http://0x0.st
	elif [[ $1 == "-f" ]]; then
		if [ $2 -eq 0 ]; then
			echo "Error, need file to post"
		else
			curl -F'file=$2' http://0x0.st
		fi
	elif [[ $1 == "-u" ]]; then
		if [ $2 -eq 0 ]; then
			echo "Error, need URL to post"
		else
			curl -F'url=$2' http://0x0.st
		fi
	elif [[ $1 == "-s" ]]; then
		if [ $2 -eq 0 ]; then
			echo "Error, need URL to shorten"
		else
			curl -F'shorten=$2' http://0x0.st
		fi
	else
		echo "Error, invalid options"
	fi
}

# wttr.in -- http://wttr.in
function wttr() {
	if [[ $1 -eq 0 ]]; then curl wttr.in/?q?0; fi
	if [[ $1 == "-h" ]]; then curl wttr.in/:help; fi
	if [[ $1 == "-u" ]] && [[ $2 == "m" ]]; then curl wttr.in/?q?0?m; fi
	if [[ $1 == "-u" ]] && [[ $2 == "i" ]]; then curl wttr.in/?q?0?i; fi
	if [[ $1 == "-1" ]]; then 
		if [[ $2 -eq 0 ]]; then curl wttr.in/?q?1; fi
		if [[ $2 == "-u" ]] && [[ $3 == "m" ]]; then curl wttr.in/?q?1?m; fi
		if [[ $2 == "-u" ]] && [[ $3 == "i" ]]; then curl wttr.in/?q?1?u; fi fi
	if [[ $1 == "-2" ]]; then 
		if [[ $2 -eq 0 ]]; then curl wttr.in/?q?2; fi
		if [[ $2 == "-u" ]] && [[ $3 == "m" ]]; then curl wttr.in/?q?2?m; fi
		if [[ $2 == "-u" ]] && [[ $3 == "i" ]]; then curl wttr.in/?q?2?u; fi fi
	if [[ $1 == "-n" ]]; then 
		if [[ $2 -eq 0 ]]; then curl wttr.in/?q?n; fi
		if [[ $2 == "-u" ]] && [[ $3 == "m" ]]; then curl wttr.in/?q?n?m; fi
		if [[ $2 == "-u" ]] && [[ $3 == "i" ]]; then curl wttr.in/?q?n?u; fi fi
	if [[ $1 == "-v" ]]; then
		if [[ $2 -eq 0 ]]; then curl wttr.in; fi
		if [[ $2 == "-u" ]] && [[ $3 == "m" ]]; then curl wttr.in/?m; fi
		if [[ $2 == "-u" ]] && [[ $3 == "i" ]]; then curl wttr.in/?u; fi fi
}

# Get my public ip
function pubip() {
	if [[ $1 -eq 0 ]]; then curl -4 icanhazip.com; fi
	if [[ $1 -eq 4 ]]; then curl -4 icanhazip.com; fi
	if [[ $1 -eq 6 ]]; then curl -6 icanhazip.com; fi
}

# Get IP Info
function ipinfo() {
	if [[ $1 -eq 0 ]]; then curl ipinfo.io; fi
	if [[ $1 == "-j" ]]; then curl ipinfo.io/json; fi
}

# ptpb -- https://ptpb.pw/
function pb() { curl -F "c=@${1:~-}" https://ptpb.pw/; }
function pbx() { curl -sF "c=@${1~-}" -w "%{redirect_url}" 'https://ptpb.pw/?r=1' -o /dev/stderr | xsel -I /deev/null -b; }
function pbs() { 
	gm import -window $1{1:-root} /tmp/$$.png
	pbx /tmp/$$.png
}

# Dictionary
function dict() { curl dict://dict.org/d:$1; }
