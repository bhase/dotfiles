# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt appendhistory
#setopt histignorespace
setopt histignoredups
#setopt sharehistory

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
#setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
#setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#setopt HIST_BEEP                 # Beep when accessing nonexistent history.

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

alias antlr4='java -Xmx500M -cp $CLASSPATH org.antlr.v4.Tool'
alias grun='java org.antlr.v4.gui.TestRig'

alias get_idf='. $HOME/github/microcontroller/espressif/esp-idf/export.sh'

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

export PATH=$PATH:$HOME/bin #:$HOME/bin/gcc-arm-none-eabi/bin:$HOME/bin/macrofusion
# export PATH=$PATH:$HOME/github/microcontroller/espressif/esp-open-sdk/xtensa-lx106-elf/bin
# export PATH=$PATH:$HOME/bin/xtensa-lx106-elf/bin
# export PATH=$PATH:$HOME/bin/Slic3r/bin
export PATH=$PATH:$HOME/bin/ugsplatform/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/bin/dtc

export CLASSPATH=$HOME/bin/java/antlr-4.7.1-complete.jar:$CLASSPATH
export CPPUTEST_HOME=$HOME/github/cpputest
#export IDF_PATH=$HOME/github/microcontroller/espressif/ESP8266_RTOS_SDK

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export MANPAGER="/bin/sh -c \"sed 's|\x1b\[[;0-9]*m||g' | iconv -c | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

neofetch
task
