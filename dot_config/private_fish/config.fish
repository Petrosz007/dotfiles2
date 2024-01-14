if status is-interactive
    # Commands to run in interactive sessions can go here

    # Remove fish_greeting
    set -U fish_greeting
end

#### Sourcing things
if test -e $HOME/.cargo/env
  bass source $HOME/.cargo/env
end

if test -e $HOME/.config/fish/env.fish
  source $HOME/.config/fish/env.fish
end

#### ENV VARS
set -gx EDITOR nvim

#### ALIASES
alias vim="nvim"
alias fish-config-reload="source $HOME/.config/fish/config.fish"
alias k="kubectl"

#### PATH
fish_add_path /opt/homebrew/bin/
fish_add_path (yarn global bin)
fish_add_path (find $HOME/.sdkman/candidates/*/current/bin -maxdepth 0)
fish_add_path $HOME/.krew/bin
fish_add_path $HOME/.local/bin # pipx
