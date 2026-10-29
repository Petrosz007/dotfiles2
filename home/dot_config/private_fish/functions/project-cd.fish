function project-cd -d "cd to a folder in ~/code/"
  cd (ls -d $HOME/code/* | fzf)
end
