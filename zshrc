# --[- System settings ]------------------------------------------------
limit -s coredumpsize 0
umask 002

# doesn't seem to work ...
# see https://github.com/zsh-users/zsh-syntax-highlighting
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')

# ---[ ZSH Options ]----------------------------------------------------
# General
setopt ALWAYS_TO_END BASH_AUTO_LIST NO_BEEP CLOBBER
# setopt AUTO_CD CD_ABLE_VARS MULTIOS

# Job Control
setopt CHECK_JOBS NO_HUP

# History
# Stay compatible to sh and IFS
setopt	SH_WORD_SPLIT

setopt notify pushdtohome
setopt recexact longlistjobs
setopt autoresume pushdsilent
setopt autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt BG_NICE HUP autoparamslash
unsetopt beep
unsetopt correct_all
setopt correct

export HISTFILE=~/.zhistory
setopt inc_append_history
export HISTCONTROL=ignoredups
export HISTSIZE=100000
export SAVEHIST=100000
export HISTIGNORE=ls


# Prompt
. ~/.zshprompt
setprompt

# ---[ Environment ]---------------------------------------------------
export EDITOR=vim
export SUDO_EDITOR=vim
# Unicode Locale
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
export TZ="America/Los_Angeles" # timezone data
export DE=kde # for right-click "open with", needed by /usr/bin/xgd-open script
export VIDEO_CARDS='nvidia'
export PYTHONDONTWRITEBYTECODE=1

# Manpath & Manualpage search order
export MANSECT=1:8:2:9:3:5:4:7:6:n

# Syntax highlight for less with 'source-highlite'
export PAGER='vimpager'
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
# prevent firefox and others from compulsively creating Desktop and
# Download folders
export XDG_DESKTOP_DIR='/tmp'
export XDG_DOWNLOAD_DIR='/tmp'
export XDG_VIDEOS_DIR='/tmp'
export PATH=/opt/google-cloud-sdk/bin:$PATH:.
export GAE_SDK_ROOT=/opt/google-cloud-sdk/platform/google_appengine

eval `dircolors`

# ---[ Alias Section ]-------------------------------------------------
alias pastebin='wgetpaste -X'
alias grin='grin -i'
alias n='cd ~/nearwoo/nearwoo_home && clear'
alias p='cd ~/pagewoo_source/src && clear'
alias rtb='cd ~/pagewoo_rtb/rtb && clear'
alias python='python2'
alias ipython='ipython2'
alias ipy='ipython2'
alias py='python2'
alias p2='python2'
alias p3='python3'
alias gd='git diff'
alias gc='git commit'
alias gch='git checkout'
alias v='vim $'
alias cd-='cd -'
alias zup='source ~/.zshrc'
alias there='cd `xclip -o`'
alias here='pwd | xclip -i'
alias halt='killall -s SIGTERM vim & sudo systemctl poweroff'
alias off='killall -s SIGTERM vim & sudo systemctl poweroff'
alias bob='ssh alice@bob.askja.de'
alias oo='libreoffice'
alias lo='libreoffice'
alias c='clear'
alias ..='cd ..'
# alias cd..='cd ..'
alias ...='cd ../..'
alias ssh='ssh -2'
alias vi='vim -c ":cd %:p:h"'
alias mc='mc -bs'
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -a --color=auto'
alias l='ls --color=auto'
alias k='ls --color=auto'
alias ks='ls --color=auto'
alias lg='ls | grep -i'
alias lag='ls -a | grep -i'
alias -g G='| grep -i'
# List only directories and symbolic
# links that point to directories
alias lsd='ls -ld *(-/DN)'
# List only hidden files
alias lsa='ls -ld .*'
#alias dog=wcat
alias a='alsamixer'
# Global aliases -- These do not have to be
# at the beginning of the command line.
alias h='head'
alias t='tail'
alias g='grep'
alias psg='ps waux | grep -i'
alias here='nocorrect here'
alias there='nocorrect . there'
alias rc.d='nocorrect rc.d'
alias list='nocorrect list'
alias gvim='nocorrect gvim'
alias mkdir='nocorrect mkdir'
alias scp='noglob scp'
alias rmswp='rm ~.swp'
alias feh='feh --scale-down --preload'
alias -s ogg=vlc
alias -s wmv=vlc
alias -s txt=vim
alias -s c=vim
alias -s m=vim
alias -s cpp=vim
alias -s h=vim
alias -s doc=libreoffice
alias -s pdf=evince
alias -s djvu='djview4 -continuous=yes'
alias -s gz=unpack
alias -s tgz=unpack
alias -s bz2=unpack
alias -s tbz=unpack
alias -s rar=unpack
alias -s tar=unpack
alias -s lha=unpack
alias -s py=vim_or_exec


# vi like settings: 
bindkey -v
bindkey -M viins 'Tab' vi-cmd-mode
# bindkey "^[[H" beginning-of-line
# bindkey "^[[F" end-of-line
# bindkey "^[[3~" backward-delete-char
# bindkey '^p' history-search-backward
# bindkey "^[[A"  history-search-backward
# bindkey "^[[B"  history-search-forward

# ---[ Completition system ]-------------------------------------------

# ignore pyc files during completion
zstyle ':completion:*:(all-|)files' ignored-patterns "(*.pyc|*~)"
## but not for these programs
zstyle ':completion:*:ls:*:(all-|)files' ignored-patterns
zstyle ':completion:*:rm:*:(all-|)files' ignored-patterns
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.o' '*.a' 'CMakeCache.txt' '.mp3' '.avi' '.pdf' 'cmake_install.cmake' 'Makefile'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format '%d:'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=3 yes
zstyle ':completion:*' prompt 'Alternatives %e:'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '~/.zshrc'
set completion-ignore-case on


# ---[ Modules ]-------------------------------------------------------
zmodload zsh/complist
autoload -U compinit && compinit -C
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -ap zsh/mapfile mapfile
autoload zcalc


# ---[ Functions ]-------------------------------------------------------

# show directory in title bar
chpwd() {
  [[ -t 1 ]] || return
  case $TERM in
    sun-cmd) print -Pn "\e]l%~\e\\"
      ;;
    *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
      ;;
  esac
}

rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}


zle -N zle-line-init
zle -N zle-keymap-select


function zle-line-init zle-keymap-select {
   case $KEYMAP in
      viins) echo -e "\033[2 q\c";; # steady block
      main) echo -e "\033[2 q\c";; # steady block
      vicmd) echo -e "\033[1 q\c";; # blink underline
   esac
   zle reset-prompt
}


function chpwd() {
    print -Pn "\e]2;%~\a"
}

function precmd() {
    print -Pn "\e]2;%~\a"
}


function unpack () {
    local old_dirs current_dirs lower
    lower=${(L)1}
    old_dirs=( *(N/) )
    if [[ $lower == *.tar.gz || $lower == *.tgz ]]; then
        tar zxfv $1
    elif [[ $lower == *.gz ]]; then
        gunzip $1
    elif [[ $lower == *.tar.bz2 || $lower == *.tbz ]]; then
        bunzip2 -c $1 | tar xfv -
    elif [[ $lower == *.bz2 ]]; then
        bunzip2 $1
    elif [[ $lower == *.zip ]]; then
        unzip $1
    elif [[ $lower == *.rar ]]; then
        unrar e $1
    elif [[ $lower == *.tar ]]; then
        tar xfv $1
    elif [[ $lower == *.lha ]]; then
        lha e $1
    else
        print "Unknown archive type: $1"
        return 1
    fi
    # Change in to the newly created directory, and
    # list the directory contents, if there is one.
    current_dirs=( *(N/) )
    for i in {1..${#current_dirs}}; do
        if [[ $current_dirs[$i] != $old_dirs[$i] ]]; then
            cd $current_dirs[$i]
            ls
            break
        fi
    done
}

# todo
compdef '_files -g "*.gz *.tgz *.bz2 *.tbz *.zip *.rar *.tar *.lha"' unpack

function vim_or_exec () {
    interps=($(whence -a "$1"))
    if [[ -z $interps[2] ]]; then
        vim "$1"
    else
        "$interps[2]" "${@:2}"
    fi
}


setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }

function bright () {
  loc='/sys/class/backlight/acpi_video0/brightness'
  max=`cat /sys/class/backlight/acpi_video0/max_brightness`
  min=1
  current=`cat $loc`
  if [[ $1 == 'more' && $current -ne $max ]]; then
    new=$(($current+1))
  elif [[ $1 == 'less' && $current -ne $min ]]; then
    new=$(($current -1))
  else 
    new=$(($current))
  fi
  echo $new | sudo tee /sys/class/backlight/acpi_video0/brightness >> /dev/null
}


function calc() {
  wcalc "$1"
}

function zzip {
  if [[ $# -eq 1 ]]; then
    zip -r "$1.zip" $1
  else
    zip "$*"; 
  fi
}


compctl -f -k'directory pattern' lg
function lg() {
  if [[ $# -eq 1 ]]; then 
    ls -1 | grep -i $1
  fi
  if [[ $# -eq 2 ]]; then 
    ls -1 $1 | grep -i $2
  fi
}

function remind () {
  cat ~/reminder | grep -i -e $1
}

zle -N rationalise-dot
bindkey . rationalise-dot

# unset config_file
