export TMP=/tmp
export TEMP=/tmp

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt histignorespace
setopt histignoredups
setopt sharehistory
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/benjo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval $(dircolors /home/benjo/.zsh/dircolors.ansi-light)
alias ls='ls --color'
alias vi='vim'

function title {
if [[ $TERM == "xterm" || $TERM == "rxvt" ]]; then
	print -nRP $'\033]0;'$*$'\a'
fi
}

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git cvs svn
zstyle ':vcs_info:git:*' formats ' (%b)'
zstyle ':vcs_info:git:*' actionformats ' (%b|%a)'

precmd() {
	psvar=()
	vcs_info
	[[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
	title "%m:%~"
}

PS1="%F{green}%n@%m:%F{yellow}%~%f%(1v.%F{green}%1v%f.) %# "

export DEJAGNU="/etc/dejagnu.conf"
export LANG=de_DE.utf8
export DESKTOP_SESSION=LXDE

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#export PATH=/home/benjo/.gem/ruby/1.9.1/bin:$PATH

export PATH=$PATH:/home/benjo/bin:/home/benjo/bin/gcc-arm-none-eabi/bin
export CPPUTEST_HOME=/home/benjo/source/cpputest
