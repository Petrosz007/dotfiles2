function root -d "cd to the root of a git directory"
  cd (git rev-parse --show-toplevel 2> /dev/null)
end
