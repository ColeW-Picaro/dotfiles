# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/histfile
HISTSIZE=1000
SAVEHIST=1000

EDITOR="emacs -nw"

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/colew/.zshrc'

autoload -Uz promptinit
promptinit

autoload -Uz compinit
compinit
# End of lines added by compinstall

prompt fire
setopt autocd


# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
