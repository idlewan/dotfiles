# Check for an interactive session
[ -z "$PS1" ] && return

#-------------  PROMPT AND TERMINAL-RELATED  --------------
BLACK_FG="\[$(tput setaf 16)\]"
GREEN_FG="\[$(tput setaf 34)\]"
GREEN_BG="\[$(tput setab 34)\]"
ORANGE_FG="\[$(tput setaf 3)\]"
YELLOW_FG="\[$(tput setaf 220)\]"
YELLOW_BG="\[$(tput setab 220)\]"
RESET="\[$(tput sgr0)\]"
BOLD="\[$(tput bold)\]"
REVERSE="\[$(tput rev)\]"

export PS1="${RESET}${GREEN_BG} \h${GREEN_FG}${YELLOW_BG}${BOLD}${BLACK_FG}\w${RESET}${YELLOW_FG} ${ORANGE_FG}"

trap 'tput sgr0' DEBUG
export PS2='> '

# disable ctrl+s freeze (XOFF/XON pair with ctrl-q)
stty -ixon

export HISTIGNORE="&:ls:[bf]g:exit:lla:lfa:rcd:date:acpi:python:make:htop:history:w:u:U:d:a:lyrics:gis:y:ya:gis:gid:p:h:htop:m:n"



#-------------  ALIASES / PROGRAMS  --------------
export EDITOR='nvim'
function rcd {
  ranger --choosedir=/tmp/chosen
  if [ -f /tmp/chosen -a "$(cat /tmp/chosen)" != "$(pwd | tr -d "\n")" ]; then
    cd "$(cat /tmp/chosen)"
  fi
  rm -f /tmp/chosen
}
bind '"\C-o":"rcd\C-m"'
#--- generic
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=always -1'
alias ll='ls --color=auto -lh1'
alias lla='ls --color=auto -lah1 --time-style=long-iso'
alias la='ls --color=auto -a1'
alias lf='ls --color=auto -1hs --group-directories-first'
alias lfa='ls --color=auto -1hsa --group-directories-first'
alias grep='grep --color=always'
alias less='less -R'
alias g='grep -nri'
alias gi='grep -nr'
alias __ag='ag --ignore nimcache --group --color -C 2 '
alias ag='rg -i -C 2 --color always --heading'
#--- other
alias b='bashmount'
alias to='transmission-remote-cli'
alias tor='transmission-remote'
alias tord='transmission-daemon'
alias d='youtube-dl'
alias lyrics='mpdlyrics'
#--- programming
alias v='nvim'
alias e='emacs -nw'
alias m='make'
alias py='python'
alias py2='python2'
alias ni='nim c --nimcache:.nimcache'
alias nio='ni --hints:off'
alias nid='ni -d:release'
alias niod='nio -d:release'
alias serv='python2 -m SimpleHTTPServer'
#--- databases
alias pgres="psql -U ubuntu -d hello_world"
#--- backups
alias rget="rsync -ahP"
#--- network
alias pi='ping 8.8.8.8'
alias netgraph='nload -u H wlp68s0'
alias hosts_reset='sudo pdnsd-ctl empty-cache news.ycombinator.com'
alias bm="wrk -H 'Host: localhost' -H 'Accept: application/json,text/html;q=0.9,application/xhtml+xml;q=0.9,application/xml;q=0.8,*/*;q=0.7' -H 'Connection: keep-alive' -d 15 -c 256 -t 1"
alias bmc="wrk -H 'Host: localhost' -H 'Accept: application/json,text/html;q=0.9,application/xhtml+xml;q=0.9,application/xml;q=0.8,*/*;q=0.7' -H 'Connection: keep-alive'"
#--- git
alias gis='git status -sb'
alias gim='git commit '
alias gia='git add '
alias gic='git checkout '
alias gib='git branch -v'
alias gil='git log --graph --abbrev-commit --no-merges --date=iso'
alias gilm='git log --graph --abbrev-commit'
alias gid='git diff --ignore-space-at-eol --diff-algorithm=patience'
alias gg='git grep --break --heading --line-number'
#--- system
alias h='htop'
alias puy='sudo pacman -Suy'
alias pacr='pacaur -Rns'
alias pacman-clean-unused-deps='sudo pacman -Rsn $(pacman -Qqdt)'
alias p='pacaur --color always'
alias pm='pacman --color always'
alias sp='sudo pacman'
alias pacs='pacaur --color always -Ss'
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

#-------------  RANDOM PROGRAMS / ONE-LINERS  --------------
alias kk="setxkbmap -layout us -variant altgr-intl -option 'ctrl:nocaps,compose:ralt,altwin:swap_alt_win'"
alias w2='pacmd set-default-sink "alsa_output.usb-041e_Creative_Bluetooth_Audio_W2_00061734003C0002-00.iec958-stereo"'
alias st_better='st -f "Misc Fixed:style=SemiCondensed:size=10:antialias=false:autohint=false,Roboto Mono for Powerline:style=Medium"'
# temporary solution to Fritzing bug
# https://github.com/fritzing/fritzing-app/issues/3221
alias fritzing='QT_AUTO_SCREEN_SCALE_FACTOR=0 Fritzing'
alias test51='speaker-test -c 6 -D surround51 -t wav'


#-------------  GENERAL FIXES  --------------
export GDK_USE_XFT=1 # anti-aliased fonts in gnome2
export ANDROID_HOME=/opt/android-sdk
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'


[[ -f ~/.bashrc_additions ]] && . ~/.bashrc_additions
