# .bashrc
export PATH="/home/ablange/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ablange/google-cloud-sdk/path.bash.inc' ]; then . '/home/ablange/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ablange/google-cloud-sdk/completion.bash.inc' ]; then . '/home/ablange/google-cloud-sdk/completion.bash.inc'; fi
