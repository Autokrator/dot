;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(load-theme 'doom-vibrant t)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq user-full-name "Parth Pathak"
      doom-font (font-spec :family "Source Code Pro"
                           :weight 'demibold
                           :size 12)
      ns-use-proxy-icon nil
      frame-title-format nil)

(set-face-foreground 'line-number-current-line (doom-color 'constants))
(set-face-attribute 'line-number-current-line nil :weight 'bold)
(after! solaire-mode
  (set-face-background 'line-number-current-line (face-attribute 'solaire-default-face :background)))
(after! treemacs
  (doom-themes-treemacs-config)
  (set-face-attribute 'treemacs-root-face nil :height 130))
(setq
 doom-modeline-buffer-file-name-style 'truncate-with-project
 doom-modeline-icon t
 doom-modeline-major-mode-icon t
 doom-modeline-major-mode-color-icon t)
(map!
 :leader
 :prefix "w"
 :desc "delete window" "d" #'ace-delete-window)
(map!
 :leader
 :desc "Switch to last buffer" "TAB" #'evil-switch-to-windows-last-buffer)
