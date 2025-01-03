if status is-interactive
  # Commands to run in interactive sessions can go here

  # Remove fish_greeting
  set -U fish_greeting

  # Starship is the shell prompt
  starship init fish | source

  # Abbreviations
  abbr --add pcd project-cd
  abbr --add k kubectl
  abbr --add yt-dlp-audio yt-dlp -f 'bestaudio[ext=m4a],bestaudio[ext=webm]' -x --audio-quality 0 --embed-metadata --embed-thumbnail --cookies-from-browser chrome
end

#### Sourcing things
if test -e $HOME/.config/fish/env.fish
  source $HOME/.config/fish/env.fish
end

if test -e /opt/homebrew/opt/asdf/libexec/asdf.fish
  source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

#### ENV VARS
set -gx EDITOR nvim
set -Ux PYENV_ROOT $HOME/.pyenv

#### ALIASES
alias vim="nvim"
alias fish-config-reload="source $HOME/.config/fish/config.fish"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale" # Will only work if tailscale is installed

#### PATH
fish_add_path /opt/homebrew/bin/
fish_add_path $HOME/.yarn/bin # Got his path from: (yarn global bin)
fish_add_path (find $HOME/.sdkman/candidates/*/current/bin -maxdepth 0)
fish_add_path $HOME/.krew/bin   # krew
fish_add_path $HOME/.local/bin  # pipx
fish_add_path $PYENV_ROOT/bin   # pyenv
fish_add_path $HOME/.cargo/bin  # cargo
fish_add_path $HOME/.nix-profile/bin/
