#!/bin/bash
#
# Replace all files under the current directory.
#
# Command usage:
#   $ $DOTPATH/sandbox/replace.sh aaa bbb  # replace "aaa" to "bbb"

regexp=$1
replacement=$2

# echo replace $regexp to $replacement

rg "$regexp" -l | xargs gsed -i s/"$regexp"/"$replacement"/g
