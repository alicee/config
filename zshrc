# --[- System settings ]------------------------------------------------
limit -s coredumpsize 0
umask 0027

# ---[ ZSH Options ]----------------------------------------------------
# General
setopt   ALWAYS_TO_END BASH_AUTO_LIST NO_BEEP CLOBBER
setopt   AUTO_CD CD_ABLE_VARS MULTIOS

# Job Control
setopt   CHECK_JOBS NO_HUP

# History
# Stay compatible to sh and IFS
setopt	 SH_WORD_SPLIT

setopt   notify pushdtohome
setopt   recexact longlistjobs
setopt   autoresume pushdsilent
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt BG_NICE HUP autoparamslash


# Prompt
. ~/.zshprompt
setprompt


# Don't expand files matching:
#fignore=(.o .c~ .old .pro)


# ---[ Environment ]---------------------------------------------------
export EDITOR=vim
export SUDO_EDITOR=vim
export CSCOPE_EDITOR=vim
# Unicode Locale
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
export TZ="America/Los_Angeles" # timezone data
export DE=kde # for right-click "open with", needed by /usr/bin/xgd-open script
#export PS_PERSONALITY='linux'
export VIDEO_CARDS='nvidia'
export PYTHONDONTWRITEBYTECODE=1

# Manpath & Manualpage search order
export MANSECT=1:2:9:8:3:5:4:7:6:n

# Syntax highlight for less with 'source-highlite'
export PAGER='vimpager'
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
# prevent firefox and others from compulsively creating DESKTOP and
# HOME folders
export XDG_DESKTOP_DIR='/tmp'
export XDG_DOWNLOAD_DIR='/tmp'
export XDG_VIDEOS_DIR='/tmp'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64:/usr/lib32
export GAE_SDK_ROOT=/opt/google-appengine-python
export PYTHONPATH=$GAE_SDK_ROOT:.

eval `dircolors`
# ---[ Alias Section ]-------------------------------------------------

alias pastebin='wgetpaste -X'
alias grin='grin -i'
alias n='cd ~/nearwoo/nearwoo_home && clear'
alias p='cd ~/pagewoo_source/src && clear'
alias pacman='yaourt --noconfirm'
#alias python='python2'
#alias ipython='ipython2'
#alias ipy='ipython2'
#alias py='python2'
#alias p2='python2'
#alias p3='python3'
alias v='vim $'
alias cd-='cd -'
alias zup='source $HOME/.zshrc'
alias there='cd `xclip -o`'
alias here='pwd | xclip -i'
alias halt='killall -s SIGTERM vim & systemctl poweroff'
alias off='killall -s SIGTERM vim & systemctl poweroff'
alias bob='ssh alice@bob.askja.de'
alias oo='libreoffice'
alias c='clear'
alias ..='cd ..'
alias cd..='cd ..'
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
# alias lg='ls | grep -i'
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
alias rc.d='nocorrect rc.d'
alias list='nocorrect list'
alias here='nocorrect here'
alias there='nocorrect . there'
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
#alias -s py=vim

# vi like settings: bindkey -v
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" backward-delete-char
bindkey '^p' history-search-backward
bindkey "^[[A"  history-search-backward
bindkey "^[[B"  history-search-forward


# ignore pyc files during completion
zstyle ':completion:*:(all-|)files' ignored-patterns "(*.pyc|*~)"
# but not for these programs
zstyle ':completion:*:ls:*:(all-|)files' ignored-patterns
zstyle ':completion:*:rm:*:(all-|)files' ignored-patterns


export HISTFILE=~/.zhistory
setopt inc_append_history
export HISTCONTROL=ignoredups
export HISTSIZE=100000
export SAVEHIST=100000
export HISTIGNORE=ls


# ---[ Shell functions ]-----------------------------------------------
setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }


#something to be fuxed wcalc 40*90
# alias calc='nocorrect wcalc'
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

# ---[ Terminal settings ]---------------------------------------------

case "$TERM" in
	linux)
		bindkey '\e[1~' beginning-of-line	# Home
		bindkey '\e[4~' end-of-line		# End
		bindkey '\e[3~' delete-char		# Del
		bindkey '\e[2~' overwrite-mode		# Insert
		;;
	screen)
		# In Linux console
		bindkey '\e[1~' beginning-of-line	# Home
		bindkey '\e[4~' end-of-line		# End
		bindkey '\e[3~' delete-char		# Del
		bindkey '\e[2~' overwrite-mode		# Insert
		bindkey '\e[7~' beginning-of-line	# home
		bindkey '\e[8~' end-of-line		# end
		# In rxvt
		bindkey '\eOc' forward-word		# ctrl cursor right
		bindkey '\eOd' backward-word		# ctrl cursor left
		bindkey '\e[3~' backward-delete-char	# This should not be necessary!
		;;
	rxvt*)
		bindkey '\e[7~' beginning-of-line	# home
		bindkey '\e[8~' end-of-line		# end
		bindkey '\eOc' forward-word		# ctrl cursor right
		bindkey '\eOd' backward-word		# ctrl cursor left
		bindkey '\e[3~' backward-delete-char	# This should not be necessary!
		bindkey '\e[2~' overwrite-mode		# Insert
		;;
	xterm*)
		bindkey "\e[1~" beginning-of-line	# Home
		bindkey "\e[4~" end-of-line		# End
		bindkey '\e[3~' delete-char		# Del
		bindkey '\e[2~' overwrite-mode		# Insert
		;;
	sun)
		bindkey '\e[214z' beginning-of-line       # Home
		bindkey '\e[220z' end-of-line             # End
		bindkey '^J'      delete-char             # Del
		bindkey '^H'      backward-delete-char    # Backspace
		eindkey '\e[247z' overwrite-mode          # Insert
		;;
esac


unsetopt beep

# ---[ Completition system ]-------------------------------------------
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
# set completion-ignore-case on

rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot


# ---[ Modules ]-------------------------------------------------------
zmodload zsh/complist
autoload -U compinit && compinit -C
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -ap zsh/mapfile mapfile
autoload zcalc


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


function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

function chpwd() {
    print -Pn "\e]2;%~\a"
}

function precmd() {
    print -Pn "\e]2;%~\a"
}

unsetopt correct_all
setopt correct

