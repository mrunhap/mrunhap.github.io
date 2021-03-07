#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
hugo

cd public
git add -A

msg="rebuilding site `LANG=C date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git push origin master

cd ..
