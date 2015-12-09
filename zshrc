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

