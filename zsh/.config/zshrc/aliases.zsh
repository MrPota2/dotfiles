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

if ! fd > /dev/null ; then
	alias fd="fdfind"
fi


alias gclean="git fetch --prune && git branch -vv | grep 'gone]' | awk '{print $1}' | xargs git branch -D"

alias ghpr="gh pr create --fill"

alias ghskip="gh pr create --fill && gh pr merge --squash --delete-branch"

alias ghsquash="gh pr merge --squash --delete-branch"



alias copy="xsel -ib"

alias i="sudo pacman -S"


# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons=always' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons=always'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons=always'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons=always' # tree listing
alias l.="eza -a | grep -e '^\.'"                                     # show only dotfiles
alias lsgr="eza --git-repos -l"						   # Show git repo statuses
