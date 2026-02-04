# The following lines were added by compinstall

zstyle ':completion:*' _complete 
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** l:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** l:|=*'
zstyle ':completion:*' original true
zstyle :compinstall filename '$HOME/.config/zshrc/completions/compinstall.zsh'

autoload -Uz compinit
compinit
# End of lines added by compinstall
