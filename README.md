# DEPRECATED

See [mozey/hist](https://github.com/mozey/hist) for Z Shell instructions


# bash_hist
Create backups of `~/.bash_history`

Inspired by: [Never lost your bash history again](https://lukas.zapletalovi.com/2013/03/never-lost-your-bash-history-again.html)

# Quick start

Get the script
```
cd ~
git clone https://github.com/mozey/bash_hist .bash_hist
```

Run it from your [profile](https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html) 
e.g. `~/.profile` or `~/.bash_profile`
```
if [ -f ~/.bash_hist/bak.sh ]; then . ~/.bash_hist/bak.sh; fi
```

Set HISTSIZE and create func to query archived history (in `.bashrc`).
[Removing duplicates in grep output](https://stackoverflow.com/a/49313231/639133).
**TODO** Sort by number of matches instead, e.g. "histogram"?
```
HISTSIZE=90000 # Set HISTSIZE to more commands than you can type in a month
function hist { 
    grep "$1" -h --color ~/.bash_history* | \
    sort -t: -u -k1,1 | \
    grep "$1" --color; 
}
```

Query archived history
```
hist something
```



