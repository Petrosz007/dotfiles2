function jj-wlog -d "Watch the jj log output"
  # ignore-working-copy will not snapshot the working copy opn the execution of the command
  watch --color --no-title jj --ignore-working-copy log --color=always
end
