# bash-bak
Create backups of `~/.bash_history`

Inspired by: [Never lost your bash history again](https://lukas.zapletalovi.com/2013/03/never-lost-your-bash-history-again.html)

# Quick start

Get the script
```
cd ~
git clone https://github.com/mozey/bash-bak .bash-bak
```

Run it from your [profile](https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html) e.g. `~/.profile` or `~/.bash_profile`
```
if [ -f ~/.bash-bak/bak.sh ]; then . ~/.bash-bak/bak.sh; fi
```

Set HISTSIZE and create func to query archived history (in `.bashrc`)
```
HISTSIZE=90000 # HISTSIZE set to more commands than you can type in a month
function hist { grep "$1" -h --color ~/.bash_history* | sort -t: -u -k1,1 | grep "$1" --color; }
```

Query archived history
```
hist something
```



