
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq backup-directory-alist '(("." . "~/.backups")))
(setq initial-scratch-message ";; Emacs Loves You")

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

;; themes directory
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; load path
(add-to-list 'load-path "~/.emacs.d/packages/")

;; package requires

;; global key bindings

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

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#303030" "dark violet" "medium orchid" "orchid" "medium violet red" "violet red" "pale violet red" "pink"])
 '(custom-enabled-themes (quote (afternoon)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d4fe9e2b0704052b42420cb90c2f1a2565f1a3e1f429b515e645ac97db3bac11" "450f3382907de50be905ae8a242ecede05ea9b858a8ed3cc8d1fbdf2d57090af" "e4c8810d9ab925567a69c11d5c95d198a4e7d05871453b2c92c020712559c4c1" default)))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX" . "#dc752f")
     ("XXXX" . "#dc752f")
     ("???" . "#dc752f"))))
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote org-mode))
 '(initial-scratch-message "# Thank you Kanye, very cool!")
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (gruvbox-theme auto-complete ## markdown-preview-eww eww-lnum markdown-mode caml zenburn-theme xresources-theme twilight-theme spacemacs-theme moe-theme)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(term-default-fg-color "orchid"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(term-color-blue ((t (:background "medium purple" :foreground "medium purple"))))
 '(term-color-cyan ((t (:background "blue violet" :foreground "blue violet"))))
 '(term-color-green ((t (:background "purple" :foreground "purple"))))
 '(term-color-magenta ((t (:background "dark orchid" :foreground "dark orchid"))))
 '(term-color-red ((t (:background "medium orchid" :foreground "medium orchid"))))
 '(term-color-white ((t (:background "orchid" :foreground "orchid"))))
 '(term-color-yellow ((t (:background "medium violet red" :foreground "medium violet red")))))

;; startup commands
(ansi-term "/bin/bash")
(split-window-right)
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
