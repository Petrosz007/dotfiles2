#!/usr/bin/env fish

# Brew only installs rustup-init, we need to install rustup
rustup-init -y
bass source $HOME/.cargo/env

# Update all the installed rust components, including the rustc version and plugins
rustup update

# Install necessary plugins
for plugin in "rustfmt" "clippy"
  rustup component add $plugin
end
