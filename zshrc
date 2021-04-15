source $HOME/.aliases
export EDITOR=nvim
export VISUAL=nvim

# http://spin.atomicobject.com/2015/01/02/python-environment-mgmt/
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# follow this instructions, but delete your old zsh first
# https://github.com/sorin-ionescu/prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PATH="$PATH:/usr/sbin"

export PATH="$PATH:$HOME/.rubies/ruby-trunk"

homebrew=/usr/local/bin:/usr/local/bin
export PATH=$homebrew:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH="/usr/local/heroku/bin:$PATH"
PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# go
export GOPATH=$HOME/projects/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# elixir versions
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

export forks_path="$HOME/code/source"
export elixir_fork_path="$forks_path/elixir"

# custom scripts path
export PATH=$PATH:$HOME/scripts
export PATH="/usr/local/opt/qt/bin:$PATH"

# docker-osx-dev
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/jose/.boot2docker/certs/boot2docker-vm
export PATH="/usr/local/opt/qt/bin:$PATH"

export PATH="$HOME/.bin:$PATH"
source /Users/jose/.asdf/asdf.sh
