
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Go programming language stuff

(add-to-list 'load-path (concat user-emacs-directory "packages/go-mode"))
(require 'go-mode)
(require 'go-eldoc)
(require 'auto-complete-config)
(require 'go-autocomplete)
(global-auto-complete-mode)

(add-hook 'go-mode-hook (lambda()
                          (local-set-key (kbd "C-j") 'go-mode-insert-and-indent)
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
                          (local-set-key (kbd "C-c C-i") 'go-goto-imports)
                          (smartparens-mode)
                          (go-eldoc-setup)
                          ))

(add-hook 'before-save-hook 'gofmt-before-save)

;; END Go programming language stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup-go-mode)

