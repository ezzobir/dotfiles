
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package gruvbox-theme
  ;; :ensure t)
;; (load-theme 'gruvbox-dark-hard t)

;; (use-package gruber-darker-theme
  ;; :ensure t)
;; (load-theme 'gruber-darker t)
(load-theme 'modus-vivendi-deuteranopia t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TRANSPARENCY
(add-to-list 'default-frame-alist '(alpha-background . 90))

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


;; مضاعفة السطر الحالي أو المنطقة المُحددة
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))
      
(global-set-key (kbd "C-,") 'duplicate-current-line-or-region)

;; ;; DUBLICATE LINE
;; (global-set-key (kbd "C-,") 'duplicate-line)

;; OVERWRITE MODE
(global-set-key (kbd "C-c o") 'overwrite-mode)

;; Toggle WINDOW SPLIT
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; typst-ts-mode
(use-package typst-ts-mode
  :ensure t)

(keymap-set typst-ts-mode-map "C-c C-c" #'typst-ts-tmenu)

;; tinymist
(with-eval-after-load 'eglot
  (with-eval-after-load 'typst-ts-mode
    (add-to-list 'eglot-server-programs
                 `((typst-ts-mode) .
                   ,(eglot-alternatives `(,typst-ts-lsp-download-path
                                          "tinymist"
                                          "typst-lsp"))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; CUSTOM FILE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq custom-file "~/.config/emacs/emacs-custom.el")
(load-file "~/.config/emacs/emacs-custom.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C++ configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-compile-and-run-cpp ()
  "Compile and run the current C++ file."
  (interactive)
  (let* ((file (buffer-file-name))
         (output (file-name-sans-extension file)))
    (compile (format "g++ %s -o %s && ./%s"
                     file output (file-name-nondirectory output)))))

;; Bind C-c C-c only in C++ mode
(add-hook 'c++-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-c") 'my-compile-and-run-cpp)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; hyprlang
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'treesit-language-source-alist
        '(hyprlang "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang"))

(use-package hyprlang-ts-mode
  :ensure t
  :custom
  (hyprlang-ts-mode-indent-offset 4))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; multiple cursors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package setup (use-package style)
(use-package multiple-cursors
  :ensure t
  :bind (("C->"     . mc/mark-next-like-this)
         ("C-<"     . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-S-c C-S-c" . mc/edit-lines)))

;; Optional but very Tsoding-like
(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; embrace
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package embrace
  :ensure t)
(global-set-key (kbd "C-.") #'embrace-commander)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; change-inner
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package change-inner
  :ensure t)
(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
