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

## MacOS keyboard layouts

ukelele is used for creating keyboard layouts, like [private_Library/colemak-dh-wide-macos-iso.keylayout](private_Library/colemak-dh-wide-macos-iso.keylayout)

Follow these steps to install and enable the .keylayout files:

1. Copy .keylayout files to /Library or ~/Library
2. Enable the .keylayout files:
    - macOS 10.10 and later: System Preferences > Keyboard > Input Sources
    - macOS 10.6 to 10.9: System Preferences > Language & Text > Input Sources
    - macOS 10.5 and earlier: System Preferences > International > Input


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
- https://github.com/edc/bass
- https://github.com/reitzig/sdkman-for-fish
- https://github.com/jethrokuan/fzf

### Profiling fish startup time

https://stackoverflow.com/questions/63290042/how-can-i-profile-the-fish-shell-init

```sh
fish --profile-startup /tmp/fish.profile -i -c exit
sort -nk2 /tmp/fish.profile
```

## Fonts
Install CascadiaCode from https://github.com/microsoft/cascadia-code/releases  

## Brew

```sh
cd ~
# List brew installs which are not present in the Brewfile
brew bundle cleanup
```

### Resources

- https://reckoning.dev/blog/fish-shell/
- https://www.chezmoi.io/

## Installed Tools

- [lf](https://github.com/gokcehan/lf): Terminal file manager
