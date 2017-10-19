(require 'package)
(setq package-archives
      '(("elpy" . "http://jorgenschaefer.github.io/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))


(global-set-key "\C-ck" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (projectile geiser json-mode flycheck company-c-headers org rjsx-mode company-tern tern magit npm-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Just magit things
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x c") 'magit-clone)


(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))

(require 'company-tern)
(require 'cc-mode)
(setq company-idle-delay 0)
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)
(add-to-list 'company-backends '(company-c-headers company-tern))
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook (lambda ()
			   (setq flycheck-checker 'c/c++-clang)
			   (setq flycheck-clang-language-standard "c++14")
			   (setq flycheck-gcc-language-standard "c++14")))
(add-hook 'c-mode-hook 'flycheck-mode)

;; https://emacs.stackexchange.com/questions/33034/change-default-company-mode-keybindings
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-t") 'company-search-toggle-filtering)


(require 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/usr/include/c++/6.3.0/")


(require 'rjsx-mode)
(add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode))
;; Set tern-mode t be automatically enabled for Javascript
(add-hook 'js-mode-hook (lambda ()
			  (tern-mode)
			  (flycheck-mode)))

;; --------------------------------------------
;; Basic configuration
(toggle-frame-maximized)                ;; Maximize Emacs on startup
(menu-bar-mode -1)                      ;; Remove menu bar
(tool-bar-mode -1)                      ;; Remove toolbar
