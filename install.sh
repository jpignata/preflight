#!/usr/bin/env bash

# Install git-secrets template for new and cloned repos
if [ ! -d "$HOME/.git-templates/git-secrets" ]
then
  echo "Installing git-secrets globally"

  git secrets --register-aws --global
  git secrets --install "$HOME"/.git-templates/git-secrets
  git config --global init.templateDir "$HOME"/.git-templates/git-secrets
else
  echo "Found git-secrets already installed globally"
fi

# Find and install hook on all existing repos in home directory
for dir in $(find "$HOME" -type d -name '.git' 2>/dev/null);
do
  echo "Installing git-secrets to $(dirname "$dir")"

  cd "$dir" && \
    git secrets --install --force 1>/dev/null && \
    git secrets --register-aws
done
