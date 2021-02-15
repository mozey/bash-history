#!/usr/bin/env bash
set -eu                   # exit on error or undefined variable
bash -c 'set -o pipefail' # return code of first cmd to fail in a pipeline

# Previous version (commit ee25ec8) used a different backup file format
#   .bash_history.YYMM
# This script can be used to convert those to the current monthly format
#   .bash_history.month.YYYY-MM

CENTURY="20"

for f in ${HOME}/.bash_history.*; do
  # Check if file path contains substring
  # https://stackoverflow.com/a/231298/639133
  if [[ ${f} =~ "month" ]]; then
    continue
  fi
  if [[ ${f} =~ "year" ]]; then
    continue
  fi
  if [[ -e ${f} ]]; then
    # Replace substring
    # https://stackoverflow.com/a/13210909/639133
    RENAMED="${f/bash_history./bash_history.month.${CENTURY}}"
    mv ${f} ${RENAMED}
    echo ${RENAMED}
  fi
done
