function jj-todo -d "Show TODOs added since main"
  # ignore-working-copy will not snapshot the working copy opn the execution of the command
  jj diff --from main --ignore-working-copy | rg "^+.*(//.*TODO.*)" -r '$1' | sed 's/\\\'/\\\\\'/g'| xargs -I {} rg --no-heading -F '{}'
end
