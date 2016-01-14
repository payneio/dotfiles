;; ========================
;;   Package System Setup
;; ========================

(require 'package)

;; Archives from which to draw packages
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                        '("org" . "http://orgmode.org/elpa/")))

;; For important compatibility libraries like cl-lib
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Update package list on first time emacs run
(when (not package-archive-contents)
  (package-refresh-contents))

(package-initialize)


;; =========================
;;    Packages
;; =========================

(require 'drag-stuff)
(global-set-key (kbd "M-<up>")   'drag-stuff-up)
(global-set-key (kbd "M-<down>") 'drag-stuff-down)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(projectile-global-mode)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; go-mode
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/Users/tleyden/Development/gocode/bin")
(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  ; Godef jump key binding                                                      
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)
(load-file "~/go/src/golang.org/x/tools/cmd/oracle/oracle.el")

;; ==========================
;;   Key Bindings
;; ==========================

;; org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; ============================
;;    Variable Configuration
;; ============================

(global-linum-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))
