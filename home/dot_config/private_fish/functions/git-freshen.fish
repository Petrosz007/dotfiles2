function git-freshen -d "Switch to origin/HEAD and pull in the new chanegs"
  git fetch && git switch (git symbolic-ref refs/remotes/origin/HEAD --short | string split / -f2) && git pull
end
