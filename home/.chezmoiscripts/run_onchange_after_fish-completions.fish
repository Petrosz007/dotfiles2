#!/usr/bin/env fish

asdf completion fish > ~/.config/fish/completions/asdf.fish

if type -q beet
  beet fish
end 
