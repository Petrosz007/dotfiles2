#!/usr/bin/env fish

############
### Python
asdf plugin-add python

# Install python versions
for python_version in "3.13.1"
  asdf install python $python_version
end

asdf set -u python "3.13.1"

# Install python apps
for app in "poetry" "black" "isort" "flake8"
  pipx install $app
end

poetry config virtualenvs.in-project true


##############
### Node.js
# Install Node.js
asdf plugin-add nodejs

for node_version in "23.5.0"
  asdf install nodejs $node_version
end

asdf set -u nodejs "23.5.0"

# Enable Node.js package managers (Yarn)
corepack enable
asdf reshim nodejs


##############
### Go
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git

for go_version in "1.23.4"
  asdf install golang $go_version
end

asdf set -u golang "1.23.4"


##############
### Deno
asdf plugin add deno https://github.com/asdf-community/asdf-deno.git

for deno_version in "2.1.9"
  asdf install deno $deno_version
end

asdf set -u deno "2.1.9"
