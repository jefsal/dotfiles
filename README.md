# Dotfiles
This repository holds the configurations of my workflow.

GNU Stow is used to create and manage symlinks for packages 
```
brew install stow
```
or

```
sudo apt install stow
```

then get started with
```
stow <package-name> <package-name>
``` 
don't specify path to select the default parent dir

## nvim: two configs, one path

`nvim-lite` and `nvim-dev` both target `~/.config/nvim` and are **alternatives** —
stow only one at a time, they'll conflict on the same symlink otherwise.

- `nvim-lite` — minimal: options, gruvbox, treesitter for a handful of languages. No LSP, no fuzzy finder.
- `nvim-dev` — full setup built on [LazyVim](https://www.lazyvim.org/): treesitter, LSP,
  `snacks.picker` as the fuzzy finder, gruvbox theme, custom dashboard header.

Switch between them:
```sh
cd ~/.dotfiles
stow -D nvim-lite   # or nvim-dev
stow nvim-dev       # or nvim-lite
```

On a low-resource machine, skip cloning the one you don't want:
```sh
rm -rf nvim-dev
stow nvim-lite
```

