
(setq inhibit-startup-screen t)            ;; Disable the startup screen

(menu-bar-mode 0)                         ;; Disable the menu bar 
(tool-bar-mode 0)                         ;; Disable the tool bar
(scroll-bar-mode 0)                       ;; Disable the scroll bar

(blink-cursor-mode 0)                     ;; Disable cursor blinking
(tooltip-mode 0)                          ;; Disable help text in a pop-up window

(global-display-line-numbers-mode 1)       ;; Display line numbers
(setq display-line-numbers-type 'relative) ;; Make line numbers relative

(global-hl-line-mode t)                    ;; Toggle line highlighting in all buffers
(global-visual-line-mode t)                ;; Enable truncated lines

(electric-pair-mode 1)
(show-paren-mode 1)

(delete-selection-mode 1)
(column-number-mode 1)

(setq isearch-allow-scroll t)

;; FONT
(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 180)

;; THEME
(use-package gruvbox-theme
  :ensure t)
(load-theme 'gruvbox-dark-hard t)

;; DIRECTION AND INPUT METHOD
;; (setq bidi-paragraph-direction left-to-right)

(defun my-toggle-bidi-direction-and-input-method ()
"just type c-\\ to toggle direction and input-method (arabic and english)"
(interactive)
(if (eq bidi-paragraph-direction 'left-to-right)
    (progn 
      (set-input-method "arabic")
      (setq bidi-paragraph-direction 'right-to-left)
     )
   (progn 
      ;;(call-interactively 'toggle-input-method)
      ;; or use 
      (set-input-method nil) 
;; default is english 
      (setq bidi-paragraph-direction 'left-to-right)
    ))
 )  ;; end defun

;; the default key for   c-\   is  toggle-input-method
(global-set-key (kbd "C-\\")   'my-toggle-bidi-direction-and-input-method)

;; ANZU
(use-package anzu
  :ensure t)
(global-anzu-mode 1)

;; OPEN INIT FILE 
(defun open-init-file ()
  "Open the Emacs configuration file."
  (interactive)
  (find-file user-init-file))
(global-set-key (kbd "C-c e") 'open-init-file) ; Press C-c e to open init.el

;; MARKDOWN
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

;; BACKUP
(setq make-backup-files t)  ;; Make backup files and is by default true
(setq backup-directory-alist '((".*" . "~/.local/share/Trash/files")))

;; DUBLICATE LINE
(global-set-key (kbd "C-,") 'duplicate-line)

;; TOGGLE WINDOW SPLIT
(defun toggle-window-split ()
(interactive)
(if (= (count-windows) 2)
(let* ((this-win-buffer (window-buffer))
(next-win-buffer (window-buffer (next-window)))
(this-win-edges (window-edges (selected-window)))
(next-win-edges (window-edges (next-window)))
(this-win-2nd (not (and (<= (car this-win-edges)
(car next-win-edges))
(<= (cadr this-win-edges)
(cadr next-win-edges)))))
(splitter
(if (= (car this-win-edges)
(car (window-edges (next-window))))
'split-window-horizontally
'split-window-vertically)))
(delete-other-windows)
(let ((first-win (selected-window)))
(funcall splitter)
(if this-win-2nd (other-window 1))
(set-window-buffer (selected-window) this-win-buffer)
(set-window-buffer (next-window) next-win-buffer)
(select-window first-win)
(if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-;") 'toggle-window-split)

;; IDO
(ido-mode 1)

;; FLX
(use-package flx
  :ensure t)

;; AVY
(use-package avy
  :ensure t)
(global-set-key (kbd "M-g s") 'avy-goto-char-timer)
(global-set-key (kbd "M-g w") 'avy-goto-word-1) ;; القفز إلى كلمة باستخدام حرفها الأول
(global-set-key (kbd "M-g l") 'avy-goto-line) ;; القفز إلى سطر

;; TYPST
;; typst-ts-mode
(use-package typst-ts-mode
  :ensure t
  :custom
  (typst-ts-watch-options "--open")
  (typst-ts-mode-grammar-location (expand-file-name "tree-sitter/libtree-sitter-typst.so" user-emacs-directory))
  (typst-ts-mode-enable-raw-blocks-highlight t)
  :config
  (keymap-set typst-ts-mode-map "C-c C-c" #'typst-ts-tmenu))

;; CUSTOM FILE
(setq custom-file "~/.config/emacs/emacs-custom.el")
(load-file "~/.config/emacs/emacs-custom.el")
