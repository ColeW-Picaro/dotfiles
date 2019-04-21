;;; Code:
(package-initialize)

(setq backup-directory-alist '(("." . "~/.backups")))
(setq initial-scratch-message ";; Thank you Kanye, very cool!")

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/elpa/")
  (require 'use-package))

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;; backups directory (.backups)
(message "Deleting old backup files...")
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files temporary-file-directory t))
    (when (and (backup-file-name-p file)
               (> (- current (float-time (fifth (file-attributes file))))
                  week))
      (message "%s" file)
      (delete-file file))))

;; global settings
(global-linum-mode t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(auto-complete-mode)
(ivy-mode)
(show-paren-mode 1)
(electric-indent-mode 1)
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu t)

(set-default-font "Iosevka-14")

;; themes directory
(add-to-list 'load-path "~/.emacs.d/themes/")

;; load path
(add-to-list 'load-path "~/.emacs.d/packages/")

;; elpa load path
(add-to-list 'load-path "~/.emacs.d/elpa/")

;; restart emacs in emacs
(defun launch-separate-emacs-in-terminal ()
  (suspend-emacs "fg ; emacs -nw"))

(defun launch-separate-emacs-under-x ()
  (call-process "sh" nil nil nil "-c" "emacs &"))

(defun restart-emacs ()
  (interactive)
  ;; We need the new emacs to be spawned after all kill-emacs-hooks
  ;; have been processed and there is nothing interesting left
  (let ((kill-emacs-hook (append kill-emacs-hook (list (if (display-graphic-p)
                                                           #'launch-separate-emacs-under-x
                                                         #'launch-separate-emacs-in-terminal)))))
    (save-buffers-kill-emacs)))

;; Kill all other buffers
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; For melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;; startup commands
;; (ansi-term "/bin/bash")
;; (split-window-right)
(find-file "~/")

;; Disabled *Completions*
(add-hook 'minibuffer-exit-hook 
	  '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
		    (kill-buffer buffer)))))

;; Disabled *Messages*
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Hooks
(add-hook 'prog-mode-hook #'auto-complete-mode)

;; Use packages
(use-package afternoon-theme)

(use-package rainbow-delimiters
  :ensure t
  :diminish rainbow-delimiters-mode
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package web-mode
  :ensure t
  :mode ("\\.css\\'" "\\.phtml\\'" "\\.tpl\\.php\\'" "\\.[agj]sp\\'" "\\.as[cp]x\\'" "\\.mustache\\'" "\\.djhtml\\'" "\\.html?\\'")
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-attr-indent-offset 2
        web-mode-style-padding 1
        web-mode-script-padding 1
        web-mode-block-padding 0
        web-mode-enable-auto-pairing t
        web-mode-enable-css-colorization t
        web-mode-enable-block-face t
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t)
  (use-package web-beautify
    :ensure t))

(use-package rainbow-mode
  :ensure t
  :after web-mode
  :diminish rainbow-mode
  :init (add-hook 'web-mode-hook 'rainbow-mode))

(use-package company
  :ensure t
  :defer 2
  :diminish company-mode "complete"
  :config (global-company-mode)
  :bind ("C-\\" . company-complete-common))

;;(use-package ewal)

;; Key Bindings
(require 'bind-key)
(bind-key* "C-x C-f" 'counsel-find-file)
(bind-key* "C-s" 'swiper)
(bind-key* "C-x C-b" 'ibuffer)

;; Custom faces
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (magit counsel swiper ivy web-beautify web-mode zenburn-theme xresources-theme w3m use-package twilight-theme spacemacs-theme rainbow-mode rainbow-delimiters monokai-theme moe-theme markdown-preview-eww markdown-mode gruvbox-theme glsl-mode eww-lnum elcord ewal dired-hacks-utils caml auto-complete))))
