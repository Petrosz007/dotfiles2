function jj-wlog -d "Watch the jj log output"
  # ignore-working-copy will not snapshot the working copy opn the execution of the command
  viddy -n 1s --no-title --disable_auto_save \
    jj --no-integrate-operation --ignore-working-copy log --color=always
end
