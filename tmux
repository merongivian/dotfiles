# List of plugins
# Supports `github_username/repo` or full git repo URLs
set -g @tpm_plugins '              \
  tmux-plugins/tpm                 \
  tmux-plugins/tmux-sensible       \
  tmux-plugins/tmux-resurrect      \
'
# Other examples:
# github_username/plugin_name    \
# git@github.com/user/plugin     \
# git@bitbucket.com/user/plugin  \

# Initializes TMUX plugin manager.
# Keep this line at the very bottom of tmux.conf.
run-shell '~/.tmux/plugins/tpm/tpm'

set -g default-terminal "screen-256color"
set -g mode-mouse on

set -g @resurrect-save 'o'
set -g @resurrect-restore 'p'

unbind C-b
set -g prefix C-s
bind C-s send-prefix

# Navigate panes like Vim.
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

set -g status-bg '#666666'
set -g status-fg '#aaaaaa'
