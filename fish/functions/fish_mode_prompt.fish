function fish_mode_prompt
    switch $fish_bind_mode
      case default
        set __fish_prompt_mode_color brred
        if [ -n "$TMUX" ]
          tmux set-option -t (tmux display-message -p '#S') window-status-current-style "fg=red,bold bg=default"
          tmux set-option -t (tmux display-message -p '#S') pane-active-border-style "fg=red,bold bg=default"
        end
      case insert
        set __fish_prompt_mode_color brblack
        if [ -n "$TMUX" ]
          tmux set-option -t (tmux display-message -p '#S') window-status-current-style "fg=magenta,dim bg=default"
          tmux set-option -t (tmux display-message -p '#S') pane-active-border-style "fg=#21242b bg=default"
        end
      case replace_one
        set __fish_prompt_mode_color yellow
        if [ -n "$TMUX" ]
          tmux set-option -t (tmux display-message -p '#S') window-status-current-style "fg=yellow,dim bg=default"
          tmux set-option -t (tmux display-message -p '#S') pane-active-border-style "fg=yellow,dim bg=default"
        end
      case visual
        set __fish_prompt_mode_color brmagenta
        if [ -n "$TMUX" ]
          tmux set-option -t (tmux display-message -p '#S') window-status-current-style "fg=magenta,bold bg=default"
          tmux set-option -t (tmux display-message -p '#S') pane-active-border-style "fg=magenta,bold bg=default"
        end
      case '*'
        set __fish_prompt_mode_color brmagenta
        if [ -n "$TMUX" ]
          tmux set-option -t (tmux display-message -p '#S') window-status-current-style "fg=magenta,bold bg=default"
          tmux set-option -t (tmux display-message -p '#S') pane-active-border-style "fg=magenta,bold bg=default"
        end
    end
    commandline -f repaint
end
