# Added by deno for some reason
if [[ ":$FPATH:" != *":/home/adrian/.zsh/completions:"* ]]; then export FPATH="/home/adrian/.zsh/completions:$FPATH"; fi

COMPLETIONS_STR=$(fdfind --glob '*.zsh' ~/.config/zshrc/completions)
COMPLETIONS=($(echo $COMPLETIONS_STR | tr '\n' ' '))

for COMPLETION in $COMPLETIONS; do
	source $COMPLETION
done
