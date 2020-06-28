#!/bin/sh

# This script creates backups of the bash history file, see
# https://github.com/mozey/bash_hist

KEEP=200
BASH_HIST=~/.bash_history
BACKUP=${BASH_HIST}.$(date +%y%m)

if [[ -s "${BASH_HIST}" && "${BASH_HIST}" -nt "$BACKUP" ]]; then
    # History file is newer then backup
    if [[ -f ${BACKUP} ]]; then
        # Backup file exists, update it
        cp -f ${BASH_HIST} ${BACKUP}
    else
        # Create new backup,
        # leave last few commands and reinitialize
        mv -f ${BASH_HIST} ${BACKUP}
        tail -n${KEEP} ${BACKUP} > ${BASH_HIST}
        history -r
    fi
fi

