;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; theming ----------------------------------------
;; (after! js2
;;   (message "after js2")
;; (modify-syntax-entry ?< "//" js2-mode-syntax-table))

(after! solaire-mode
  (solaire-global-mode -1))

(setq ivy-posframe-display-functions-alist
      '((swiper          . nil)
        (complete-symbol . ivy-posframe-display-at-point)
        (counsel-M-x     . ivy-posframe-display-at-frame-center)
        (t               . ivy-posframe-display-at-frame-center)))
(setq ivy-posframe-parameters
      '((internal-border-width . 20)))
(setq ivy-posframe-border-width 0
      ivy-posframe-min-width 130)
(defun reset-posframe-size(frame)
  (let ((curr-width (frame-width frame)))
    (if (> curr-width 130) (ivy-posframe-mode 1) (ivy-posframe-mode 0))))
(add-to-list 'window-size-change-functions 'reset-posframe-size)
(ivy-posframe-enable)


(load-theme 'doom-one-vapor t)
(set-face-foreground font-lock-type-face (doom-lighten 'yellow 0.8))

(doom-themes-org-config)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq user-full-name "Parth Pathak"
      doom-font (font-spec :family "Source Code Pro"
                           :weight 'normal
                           :size 13)
      frame-title-format nil)
(setq-default
      line-spacing 1)
(setq
 doom-modeline-buffer-file-name-style 'truncate-with-project
 doom-modeline-icon t
 doom-modeline-major-mode-icon t)

(setq
   tab-width 2
   js-indent-level 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   js2-basic-offset 2)

(setq
 flycheck-check-syntax-automatically '(save mode-enable)
 flycheck-idle-change-delay 4)

(add-hook!
  (c-mode c++-mode emacs-lisp-mode python-mode js-mode js2-mode rjsx-mode typescript-mode nxml-mode)
  (rainbow-delimiters-mode-disable)
  ;; (flyspell-prog-mode)
  )


(add-hook! (js-mode js2-mode js-jsx-mode rjsx-mode typescript-mode) ;; Fix for doom vapor in js2-mode
  (font-lock-mode 0)
  (run-with-timer 1 nil (lambda()(font-lock-mode 1))))

(setq python-shell-interpreter "python3"
      flycheck-python-pycompile-executable "python3")

(add-hook! (org-mode)
  (push '("[ ]" . "☐") prettify-symbols-alist)
  (push '("[X]" . "☑" ) prettify-symbols-alist)
  (push '("[-]" . "❍" ) prettify-symbols-alist)
  (prettify-symbols-mode)
  (+org-pretty-mode))

;; scrolling --------------------------------------
(setq scroll-conservatively 101
      mouse-wheel-scroll-amount '(1)
      mouse-wheel-progressive-speed nil)

(add-to-list 'default-frame-alist '(height . 150))
(add-to-list 'default-frame-alist '(width . 150))

;; bindings ---------------------------------------
(map! :leader :desc "Switch to last buffer" "TAB" #'evil-switch-to-windows-last-buffer)
(map! :leader :prefix "w" :desc "delete window" "d" #'delete-window)
(map! :leader :prefix "b"
      :desc "delete buffer" "d" #'kill-this-buffer
      :desc "kill buffer and window" "k" #'kill-buffer-and-window)
(map! :nv "gb" #'xref-pop-marker-stack)

;; work-flow ---------------------------------------
(setq flycheck-global-modes '(not text-mode c-mode c++-mode conf-mode org-mode))
(setq ivy-extra-directories nil)
(set-face-background 'ivy-posframe (doom-darken 'bg 0.17))



;; TODO disable auto fill mode in markdown mode

;; (setq org-agenda-files (list "~/cpu.org"))
;; (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
;; (setq org-capture-templates
;;       '(("v" "Task" entry (file+headline "~/cpu.org" "ROM")
;;          "[ ] TESTING TEXT")))

;; (define-key global-map "\C-cx"
;;         (lambda () (interactive) (org-capture nil "x")))
