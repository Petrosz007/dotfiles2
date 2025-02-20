#!/usr/bin/env fish


for plugin in "ns" "ctx"
  kubectl krew install $plugin
end
