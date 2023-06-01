function project-cd
  cd (ls -d $HOME/code/* | fzf)
end
