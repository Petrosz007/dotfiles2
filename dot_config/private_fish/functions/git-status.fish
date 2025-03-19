function git-status --description 'git status -s'
  if ! is_git_dir
    return
  end
  set -l base_command git status -s
  set -l bind_reload "reload($base_command)"
  set -l bind_commands "ctrl-a:execute-silent(git add {2})+$bind_reload"
  set bind_commands $bind_commands "ctrl-u:execute-silent(git restore --staged {2})+$bind_reload"
  set -l bind_str (string join ',' $bind_commands)

  set -l out (command $base_command | \
    fzf --exit-0 \
    --preview="[ '??' = {1} ] && bat --color=always {2} || git diff {2}" \
        --expect=ctrl-m,ctrl-r,ctrl-v,ctrl-c \
        --bind $bind_str \
        --header='C-a: add, C-u: unstage, C-c: commit, C-m(Enter): edit, C-r: rm, C-v: mv' \
  )
  [ $status != 0 ]; and commandline -f repaint; and return

  if string length -q -- $out
    set -l key $out[1]
    set -l file (echo $out[2] | awk -F ' ' '{ print $NF }')

    if test $key = 'ctrl-v'
      commandline -f repaint
      commandline "git mv $file "
    else if test $key = 'ctrl-r'
      commandline "git rm $file "
      commandline -f execute
    else if test $key = 'ctrl-m'
      commandline "$EDITOR $file"
      commandline -f execute
    else if test $key = 'ctrl-c'
      commandline "git commit -v"
      commandline -f execute
    else
      commandline -f repaint
    end
  end
end
# git status -s | fzf --preview="[ '??' = {1} ] && bat --color=always {2} || git ddiff {2}"
