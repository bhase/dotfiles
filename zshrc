# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
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

autoload -Uz promptinit
promptinit
autoload -Uz compinit
compinit
# End of lines added by compinstall

eval $(dircolors /home/benjo/.zsh/dircolors.ansi-dark)
alias ls='ls --color'
alias vi='vim'

function title {
if [[ $TERM == "xterm" || $TERM == "rxvt" ]]; then
	print -nRP $'\033]0;'$*$'\a'
fi
}

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git cvs svn hg
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
export LESS="-R"
export RI="--format=ansi"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# reset bindings from /etc/zsh/zshrc
[[ -z "$terminfo[kcuu1]" ]] || bindkey -M viins "$terminfo[kcuu1]" up-line-or-history
[[ -z "$terminfo[kcud1]" ]] || bindkey -M viins "$terminfo[kcud1]" down-line-or-history

[[ "$terminfo[kcuu1]" == ""* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" up-line-or-history
[[ "$terminfo[kcud1]" == ""* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" down-line-or-history

bindkey "^[[2~" yank                    # Insert
bindkey "^[[3~" delete-char             # Del
bindkey "^[[5~" history-search-backward # PageUp
bindkey "^[[6~" history-search-forward  # PageDown

export PATH=$PATH:/home/benjo/bin:/home/benjo/bin/gcc-arm-none-eabi/bin
export CPPUTEST_HOME=/home/benjo/source/cpputest
