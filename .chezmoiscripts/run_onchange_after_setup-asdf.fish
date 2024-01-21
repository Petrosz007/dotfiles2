#!/usr/bin/env fish

############
### Python
asdf plugin-add python

# Install python versions
for python_version in "3.12.1"
  asdf install python $python_version
end

asdf global python "3.12.1"

# Install python apps
for app in "poetry" "black" "isort" "flake8"
  pipx install $app
end

poetry config virtualenvs.in-project true


##############
### Node.js
# Install Node.js
asdf plugin-add nodejs

for node_version in "21.6.0"
  asdf install nodejs $node_version
end

asdf global nodejs "21.6.0"
