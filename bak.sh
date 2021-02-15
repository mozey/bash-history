#!/usr/bin/env bash
# WARNING Do not exit on error since this file is included in ~/.bashrc

# This script creates backups of the bash history file, see
# https://github.com/mozey/bash_hist

HOME=${HOME}

# KEEP number of lines from tail of BASH_HIST when creating new BACKUP
KEEP=200
# BASH_HIST location of bash history file
BASH_HIST=${HOME}/.bash_history
# BACKUP is the monthly backup file for bash history
BACKUP=${BASH_HIST}.month.$(date +%Y%m)

# https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html
#
#   -s file
#     True if file exists and has a size greater than zero.
#
#   file1 -nt file2
#     True if file1 is newer (according to modification date) than file2,
#     or if file1 exists and file2 does not.
#
if [[ -s "${BASH_HIST}" && "${BASH_HIST}" -nt "$BACKUP" ]]; then
  # History file is newer then backup
  if [[ -f ${BACKUP} ]]; then
    # Backup file exists, update it
    cp -f ${BASH_HIST} ${BACKUP}
  else
    # Create new backup,
    # leave last few commands and reinitialize
    mv -f ${BASH_HIST} ${BACKUP}
    tail -n${KEEP} ${BACKUP} >${BASH_HIST}
    history -r
  fi
fi
