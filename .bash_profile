source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
source /usr/local/bin/virtualenvwrapper.sh

export LANG="ru_RU.UTF-8"
export LC_ALL="ru_RU.UTF-8"
export LC_CTYPE="UTF-8"
export LC_MESSAGES="C"

PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/libexec"
export PATH="${PATH}:${HOME}/bin"
export PS1="\[\e[0;36m\]\u\[\e[m\]@\[\e[1;33m\]\h\[\e[m\]:\W$ "

export EDITOR="subl -w"

export NODE_PATH="/usr/local/lib/node_modules"

if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
fi
