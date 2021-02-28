# Enable git branch name to be displayed in prompt
source ~/.git-prompt.sh

# Enable auto-completion of git branch names
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Set aliases
alias ll='ls -all'

# Set prompt
export PS1='\e[0;34m[\u@\h]\e[m \e[0;95m(\w)\e[m $(__git_ps1 "\e[0;92m(%s)\e[m") \n\$ '

# Get aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Set user specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
