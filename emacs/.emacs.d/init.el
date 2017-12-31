;;; .init.el -- My emacs config.
;;; Commentary:
;;
;; The base 'main' config file.
;; For set of specific configs, they will have their own file.
;; Location for those configs should be under '~/.emacs.d/arnas/'.
;; ...also, Aaron Bieber's config setup was used as reference:
;; "https://github.com/aaronbieber/dotfiles/tree/master/configs/emacs.d"
;;
;;; Code:
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; Add my configs location.
(add-to-list 'load-path (expand-file-name "arnas" user-emacs-directory))

;; Stop emacs messing with the config file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; packages setup...
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;; (Package config sets are self contained, so they 'self install' so to speak.)

;; Load config sets.
(require 'init-evil-mode)

;;; Work in progress stuff...
;;; These should be temp solutions/tests...
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(message "Deleting old backup files...")
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files temporary-file-directory t))
    (when (and (backup-file-name-p file)
	       (> (- current (float-time (nth 5 (file-attributes file))))
		  week))
      (message "%s" file)
      (delete-file file))))
