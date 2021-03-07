#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub Pages...\033[0m"
hugo

cd public
git add -A

msg="rebuilding site `LANG=C date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git push origin main

cd ..

echo -e "\033[0;32mDeploying updates to GitHub bookshelf...\033[0m"

git add -A

msg="update"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git push origin main
