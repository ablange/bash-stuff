# enables branch name to be displayed in command prompt
source ~/.git-prompt.sh

# enable auto-completion of branch names at command line
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# aliases
alias ll='ls -all'

# .bash_profile
export PS1='\e[0;34m[\u@\h]\e[m \e[0;95m(\w)\e[m $(__git_ps1 "\e[0;92m(%s)\e[m") \n\$ '

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
