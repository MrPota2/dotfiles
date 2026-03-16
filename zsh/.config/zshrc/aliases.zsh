# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias gclean="git fetch --prune && git branch -vv | grep 'gone]' | awk '{print $1}' | xargs git branch -D"

alias ghrp="gh pr create --fill"

alias lsgr="eza --git-repos -l"


alias copy="xsel -ib"

alias i="sudo pacman -S"
