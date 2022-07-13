;;; Menu bar
(menu-bar-mode -1)
;;; Scroll bar
(scroll-bar-mode -1)
;;; Tool bar
(tool-bar-mode -1)
;;; Backup files
(setq make-backup-files nil)
;;; Welcome screen
(setq inhibit-startup-screen t)
;;; Make the yes or no prompts shorter
(defalias 'yes-or-no-p 'y-or-n-p)
;;; Remove the whitespace at the end of lines
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;; Set font
(set-frame-font "Consola Mono 12" nil t)
;;; Auto complete pair
(add-hook 'prog-mode-hook 'electric-pair-mode)

;;; Config packages
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "http://mirrors.ustc.edu.cn/elpa/nongnu/")
			 ("org" . "http://orgmode.org/elpa/")))
(defun install-package (name)
  (unless (package-installed-p name)
    (package-refresh-contents)
    (package-install name)
    (eval-when-compile (require name))))

(install-package 'benchmark-init)
;; (add-hook 'after-init-hook 'benchmark-init/deactivate)
(add-hook 'after-init-hook
	  (lambda () (message "loaded in %s" (emacs-init-time))))


(setq gc-cons-threshold 10000000)
;; Restore after startup
(add-hook 'after-init-hook
	  (lambda ()
	    (setq gc-cons-threshold 1000000)
	    (message "gc-cons-threshold restored to %S"
		     gc-cons-threshold)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(benchmark-init)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
