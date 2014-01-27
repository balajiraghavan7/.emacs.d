
;; Unset keybinding to avoid accidently closing frame
(global-unset-key (kbd "s-w"))

;; Trying to find keybinding for simple toggling active window
(global-unset-key (kbd "M-o"))
(global-set-key (kbd "M-o") 'other-window)

;; Try moving help command away from C-h and use it as backspace instead
;; http://www.emacswiki.org/emacs/BackspaceKey
(global-set-key (kbd "C-x h") 'help-command)
(global-set-key (kbd "C-h") 'delete-backward-char)

(global-set-key (kbd "M-h") 'backward-kill-word)

(global-set-key (kbd "C-c C-p") 'mark-paragraph)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Window switching. (C-x o goes to the next window)
;; Switch to other (previous?) window
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1))) ;; back one

;; Moving down and up a paragraph
;; (global-set-key "\M-n" 'forward-paragraph)
;; (global-set-key "\M-p" 'backward-paragraph)

;; Go to line
(global-set-key "\M-g" 'goto-line)

;; Replace buffer-menu with ibuffer
;; TODO: There seems to be much more to ibuffer than just a prettier buffer list...
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Emacs help shortcuts
(global-set-key (kbd "C-c C-f") 'find-function)
(global-set-key (kbd "C-c C-k") 'find-function-on-key)
(global-set-key (kbd "C-c C-v") 'find-variable)
(global-set-key (kbd "C-c C-l") 'find-library)

;; activate occur inside isearch
;; TODO: Better understand how to use occur
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp
                 isearch-string
               (regexp-quote isearch-string))))))

;; Magit git stuff. TODO: Learn about magit
;; TODO: Learn magit. Until then, turn it off
(global-set-key (kbd "C-x g") 'magit-status)

;; Function for toggling comment of region or line. 
(global-set-key (kbd "C-q") (lambda () (interactive)
                              (let (beg end)
                                (if (region-active-p)
                                    (setq beg (region-beginning) end (region-end))
                                  (setq beg (line-beginning-position) end (line-end-position)))
                                (comment-or-uncomment-region beg end))))

;; Cycle between visible buffers with shortcut keys

;; Termcap or terminfo should set these.

(require 'windmove)
;; (global-set-key (kbd "M-q")  'windmove-left)
;; (global-set-key (kbd "M-w") 'windmove-right)

;; Sometimes we need a temporary text-mode scratch buffer.
(global-set-key (kbd "C-c C-s") (lambda () (interactive)
                                  (progn
                                  (switch-to-buffer
                                   (get-buffer-create (generate-new-buffer-name "*scratch*")))
                                    (text-mode))))


;;; keybindings for function keys
(define-key global-map [f1] 'find-file)
(define-key global-map [f2] 'save-buffer)
(define-key global-map [f3] 'other-window)
(define-key global-map [f4] 'switch-to-buffer)

(define-key global-map [f5] 'go)
(define-key global-map [f6] 'go-build)
(define-key global-map [f7] 'go-test-current)
(define-key global-map [f8] 'go-vet1)

(define-key global-map [f9] 'rgrep)
(define-key global-map [f10] 'query-replace)

(define-key global-map [f11] 'my-toggle-fullscreen)
(define-key global-map [f12] 'kill-buffer)

(define-key global-map [(control z)] 'undo)

(global-unset-key (kbd "C-r"))
(define-key global-map [(control r)] 'redo)


(define-key global-map [(control down)] 'forward-paragraph)
(define-key global-map [(control up)] 'backward-paragraph)



(provide 'key-bindings)
