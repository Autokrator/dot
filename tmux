unbind ,
unbind .
unbind w
unbind t
unbind c
unbind &
unbind l
unbind h

set -g default-terminal "screen-256color"
set -ga terminal-overrides ',*256col*:Tc'
setw -g mouse on
set-option -g default-shell /usr/local/bin/fish
set-option -g status-position bottom
set-window-option -g xterm-keys on
bind-key -n S-Up set-option -g status
bind-key -n S-Down set-option -g status
bind-key -n S-Left previous-window
bind-key -n S-Right next-window
bind-key t new-window 'fish' 
bind-key w kill-window
bind-key h previous-window
bind-key l next-window
bind-key < swap-window -t :-
bind-key > swap-window -t :+
bind-key c command-prompt 'rename-window %%' 
set-option -g status-fg white
set-option -g status-bg default
set-option -g status-attr default
set-window-option -g window-status-fg default
set-window-option -g window-status-bg default
set-window-option -g window-status-attr default
set-window-option -g window-status-current-fg red
set-window-option -g window-status-current-bg default
set-window-option -g window-status-current-attr default
set-option -g message-fg white
set-option -g message-bg black
set-option -g message-attr bright
set -g status-left " "
set -g status-justify left
# set -g window-status-current-format '  #(echo "#{pane_current_command}")  '
set -g window-status-format '  #W  ' 
set -g window-status-current-format '  #W  '
set -g status-right " "
unbind C-b
set -g prefix C-a 
bind C-a send-prefix
set-window-option -g mode-keys vi
set -g automatic-rename off
set -g pane-border-status bottom
# set -g pane-border-format ""
set -g pane-active-border-style bg='#1c1e1f'
set -g pane-active-border-style fg='#1c1e1f'
set -g pane-border-style bg='#1c1e1f'
set -g pane-border-style fg='#1c1e1f'
