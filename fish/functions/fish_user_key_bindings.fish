function fish_user_key_bindings
  fish_vi_key_bindings
  fzf_key_bindings
  bind -M insert \cL accept-autosuggestion
  bind -M insert \cK history-search-backward
  bind -M insert \cJ history-search-backward
  bind -M insert \cH beginning-of-line

  bind -e -M insert \ct
  bind -e \ct
  bind \cf fzf-file-widget
  bind -M insert \cf fzf-file-widget

  bind -e -M insert \ec
  bind -e \ec
  bind \cd fzf-cd-widget
  bind -M insert \cd fzf-cd-widget

  # bind -M insert \cr fzf-history-widget
end
