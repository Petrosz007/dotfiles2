#!/usr/bin/env fish

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
