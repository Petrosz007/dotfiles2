# dotfiles2

## Chezmoi

https://www.chezmoi.io/quick-start/#start-using-chezmoi-on-your-current-machine

To init chezmoi on a new machine:
```sh
chezmoi init git@github.com:Petrosz007/dotfiles2.git
```

```sh
chezmoi add ~/.bashrc # Adds a file to chezmoi
chezmoi edit # Opens up the folder in your editor
chezmoi diff # Shows the diff of the files in chezmoi vs the home dir
chezmoi -v apply # Applies the version tracked by cheznoi, -v is verbose, shows the diff
```

## fish

### Set fish as the default shell

Add this line to `/etc/shells`, with `sudo vi /etc/shells`

```
/opt/homebrew/bin/fish
```

And then

```sh
chsh -s /opt/homebrew/bin/fish
```

```sh
# Install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

fisher update # Installs all the fisher plugins
fish_update_completions # Generates completions from manpages
```

### Installing a new fish plugin

If you want to install a new fish plugin, add it to the `dot_config/private_fish/fish_plugins` file. When you do `chezmoi apply`, it'll run the `.chezmoiscripts/run_onchange_install-fisher-plugins.fish.tmpl` script, which'll call `fisher update`, which will install and update all the plugins in the `fish_plugins` file.


### Key Bindings

| Key    | Description        |
|--------|--------------------|
| Ctrl-T | fzf a file name    |
| Ctrl-R | fzf history search |

### Plugins

- https://github.com/jorgebucaran/fisher
- https://github.com/ilancosman/tide
- https://github.com/edc/bass
- https://github.com/reitzig/sdkman-for-fish
- https://github.com/FabioAntunes/fish-nvm
- https://github.com/jethrokuan/fzf

## Fonts
Install CascadiaCode from https://github.com/microsoft/cascadia-code/releases  

### Resources

- https://reckoning.dev/blog/fish-shell/
- https://www.chezmoi.io/

## Installed Tools

- [lf](https://github.com/gokcehan/lf): Terminal file manager
