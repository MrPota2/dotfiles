# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pj dotnet)

source $ZSH/oh-my-zsh.sh


if [[ -f ~/.config/zshrc/aliases.zsh ]]; then
	source ~/.config/zshrc/aliases.zsh
else
	echo "aliases.zsh not found, skipping"
fi

if [[ -f ~/.config/zshrc/paths.zsh ]]; then
	source ~/.config/zshrc/paths.zsh
else
	echo "paths.zsh not found, skipping"
fi

if [[ -f ~/.config/zshrc/completions.zsh ]]; then
	source ~/.config/zshrc/completions.zsh
else
	echo "completions.zsh not found, skipping"
fi

eval "$(zoxide init zsh)" # Must be ran after compinit so is added here

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by get-aspire-cli.sh
export PATH="$HOME/.aspire/bin:$PATH"
