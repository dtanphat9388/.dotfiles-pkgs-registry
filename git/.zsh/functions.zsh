#!/bin/bash

#-- aliases
#-- autocomplete
#-- functions
gitgc () {
  git gc --prune=now
  git remote prune origin
  git clean -xdf
  git branch -D $(git branch --merged)
}
