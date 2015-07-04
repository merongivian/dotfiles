set -g default-terminal "screen-256color"
set -g mode-mouse on

set -s escape-time 0

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
