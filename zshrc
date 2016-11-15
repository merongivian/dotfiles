source $HOME/.aliases

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

# init with rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
