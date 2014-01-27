;;; package --- Summary
;;; Commentary:
;;; Code:



;;; Setup  path to include gitbin path 

(setenv "PATH" (concat "C:\\Program Files (x86)\\Git\\bin;"  (getenv "PATH") ))



;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "emacs-customize.el" user-emacs-directory))
(load custom-file)

;; No startup screen
(setq inhibit-startup-screen t)

;; Turning off mouse interface early
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path user-emacs-directory)

(add-to-list 'load-path "D:/goco/src/github.com/dougm/goflymake")

(require 'load-packages)
(require 'misc)
(require 'key-bindings)
(require 'setup-defaults)

(when (eq system-type 'darwin)
  (require 'osx))
(when (eq system-type 'windows-nt)
  (require 'windows)
  (require 'setup-pandoc-mode))

(require 'setup-helm)
(require 'setup-ace-jump)

(require 'setup-multi-term)
(require 'setup-smartparens)
(require 'setup-ido)
(require 'setup-smex)
(require 'setup-flyspell)
(require 'setup-expand-region)
(require 'setup-bookmarks)
(require 'setup-anzu)
(require 'setup-dired)
(require 'setup-ediff)
(require 'setup-rebuilder)
(require 'setup-undo-tree)
(require 'setup-web-mode)
(require 'setup-yasnippet)
(require 'setup-markdown)

(require 'setup-go-mode)
(require 'setup-cpp-mode)
(require 'setup-python-mode)

(require 'auto-complete-config)
(require 'go-autocomplete)

(require 'go-errcheck)

(require 'flymake-cursor)


(require 'go-flymake)
(require 'go-flycheck)



;; (require 'help-fns+)

;; Helm, successor of anything
;;(require 'helm-config) WINDOWS

;; Keep modeline tidy with diminish
(require 'diminish)

;; visible mark WINDOWS
;;(require 'visible-mark)
;;(visible-mark-mode)

;; Highlight recent changes, such as yank or undo
;; (require 'volatile-highlights)
;; (volatile-highlights-mode t)
;; (diminish 'volatile-highlights-mode)


;; abbrev mode in text mode
;; (perhaps move to a 'text-mode section'...?)
(add-hook 'text-mode-hook 'abbrev-mode)

;; change undo stuff
(setq undo-limit 3600)

;; insert stuff 
(delete-selection-mode 1)

;; scss modes
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))


;; helper function
(defun go ()
  "run current buffer"
  (interactive)
  (compile (concat "go run \"" (buffer-file-name) "\"")))

;; helper function
(defun go-build ()
  "build current buffer"
  (interactive)
  (compile (concat "go build  \"" (buffer-file-name) "\"")))

;; helper function
(defun go-build-dir ()
  "build current directory"
  (interactive)
  (compile "go build ."))

;; helper function
(defun go-vet ()
  "vet current buffer"
  (interactive)
  (compile (concat "go tool vet -v \"" (buffer-file-name) "\"")))

(defun go-vet1 ()
  "vet current buffer"
  (interactive)
  (compile "go tool vet -v ."))


;; helper function
(defun go-test-package ()
  "test package"
  (interactive)
  (let
      ((pkg (read-from-minibuffer "Test package: " nil nil nil 'hook-go-pkg)))
    (if (not (string= pkg ""))
        (compile (concat "go test \"" pkg "\"")))))

;;; helper function 
(defun go-test-current ()
  "test current dir"
  (interactive)
  (compile "go test -v"))


;; helper function
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))

;; start in fullscreen mode 
(defvar my-fullscreen-p t "Check if fullscreen is on or off")

(defun my-non-fullscreen ()
  (interactive)
  (if (fboundp 'w32-send-sys-command)
	  ;; WM_SYSCOMMAND restore #xf120
	  (w32-send-sys-command 61728)
	(progn (set-frame-parameter nil 'width 82)
		   (set-frame-parameter nil 'fullscreen 'fullheight))))

(defun my-fullscreen ()
  (interactive)
  (if (fboundp 'w32-send-sys-command)
	  ;; WM_SYSCOMMAND maximaze #xf030
	  (w32-send-sys-command 61488)
	(set-frame-parameter nil 'fullscreen 'fullboth)))

(defun my-toggle-fullscreen ()
  (interactive)
  (setq my-fullscreen-p (not my-fullscreen-p))
  (if my-fullscreen-p
	  (my-non-fullscreen)
	(my-fullscreen)))

(split-window-right) 

(speedbar 1)
(speedbar-add-supported-extension ".go")

(provide 'init)
