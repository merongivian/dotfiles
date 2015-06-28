export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin

eval "$(rbenv init -)"

alias Emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
export PATH=/usr/local/bin:$PATH

# Add GHC 7.8.3 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.3.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi
