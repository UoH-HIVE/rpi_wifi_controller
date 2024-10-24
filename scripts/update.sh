#! /usr/bin/env bash

# set vars
DIR_SRC="/root/src"
DIR_LOCAL="/root/local"

echo "start..."

# cd to src
cd "$DIR_SRC"

echo "cd successful"

# Fetch the latest changes from the remote
git fetch

echo "fetch successful"

# Get the current branch name
current_branch=$(git rev-parse --abbrev-ref HEAD)

echo "branch success"

# Check if the current branch is behind the remote
behind=$(git rev-list --count "${current_branch}".."origin/${current_branch}")

echo "behind success"


if [ "$behind" -gt 0 ]; then
  echo "Updates available for '$current_branch'. Pulling changes..."
  git pull origin "$current_branch"
  bash "$DIR_LOCAL/setup.sh"
else
    echo "Branch '$current_branch' is up to date."
fi

sleep 900