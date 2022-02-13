# Awesome platform-independent ls formatting
# Adapted from code found at <http://www.reddit.com/r/linux/comments/hejra/til_nifty_ls_option_for_displaying_directories/c1utfxb>
GLS_ARGS="--classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable --group-directories-first"
alias ls="ls $GLS_ARGS"
ls &> /dev/null
if [ $? -eq 1 ]; then # The environment ls isn't GNU ls; we're not on Linux
  # On OS X, use gls if it has been installed via Homebrew
  if hash gls &> /dev/null; then
    alias ls="gls $GLS_ARGS"
  else
    alias ls='ls -G' # If not, fall back to BSD ls
  fi
fi

# aliases
# usage - pass docker container name to get IP
alias ap=ansible-playbook
alias mem='top -o rsize'
alias c=clear
alias cpu='top -o cpu'
alias dc=docker-compose
alias docker_ip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias docker_host="echo $(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)"
alias grep='grep --color'
alias lsd='ls -lah | grep "^d"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

# Mac
alias f="open -a Finder ./"
alias lsappstore="mdfind kMDItemAppStoreHasReceipt=1"
alias flushdns="sudo killall -HUP mDNSResponder"
