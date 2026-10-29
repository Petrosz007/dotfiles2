function jj-changes --description 'jj log -r main..@ with changes shown'
  jj log -r "main..@" --no-graph --color=always -T 'change_id.short() ++ " " ++ description.first_line() ++ "\n"' | \
    fzf --ansi --preview "jj log --summary -r {1} --color=always"
end
