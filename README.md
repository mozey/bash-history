# bash-history
Create backups of `~/.bash_history`

Inspired by: [Never lost your bash history again](https://lukas.zapletalovi.com/2013/03/never-lost-your-bash-history-again.html)

# Quick start

Get the script
```
cd ~
git clone https://github.com/mozey/bash-bak .bash-bak
```

Run it from your profile
```
HISTSIZE=90000 # HISTSIZE set to more commands than you can type in a month
if [ -f ~/.bash-bak/bak.sh ]; then . ~/.bash-bak/bak.sh; fi
```

Create alias to query archived history
```
alias hist="grep xyz -h --color ~/.bash_history.*"
```

Query archived history
```
hist something
```



