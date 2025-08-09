## Stow

```bash
stow <package>   # e.g., stow zsh
stow */          # stow everything
```

## Add new config

Put the file in the right folder matching `$HOME` structure, commit, push, then `stow` it.

## Unstow

```bash
stow -D <package> # -D -> Delete
```
