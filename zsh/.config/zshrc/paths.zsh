export PATH="$PATH:/home/adrian/bin"

if [[ -f /opt/mssql-tools18/bin ]]; then
	export PATH="$PATH:/opt/mssql-tools18/bin"
else
	echo "Missing mssql-tools18"
fi


if [[ -d /$HOME/.dotnet/tools ]]; then
	export PATH="$PATH:$HOME/.dotnet/tools"
fi


# Created by `pipx` on 2025-05-30 20:31:22
export PATH="$PATH:/home/adrian/.local/bin"
if [[ -d $HOME/.cargo/env ]]; then
	. "$HOME/.cargo/env"
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by get-aspire-cli.sh
export PATH="$HOME/.aspire/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
