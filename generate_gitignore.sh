#!/bin/sh

# Update gitignore submodule
git submodule add git@github.com:github/gitignore.git
git submodule init
git submodule foreach git pull origin master

# Build gitignore_global, replacing the old one
cat gitignore/Global/* > .gitignore_global

# Add more that suites my needs
echo .gdb_history >> .gitignore_global

echo ".gitignore_global updated."
