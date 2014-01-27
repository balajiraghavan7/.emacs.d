;; Blinking cursor - yes? no?
(blink-cursor-mode -1)

;; Highlight the current line, or not
(global-hl-line-mode 1)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Global Line Number Mode, plus formatting
(global-linum-mode 1)
(setq linum-format "%3d\u2502")

;; Mode line settings
(column-number-mode 1)
(line-number-mode -1)
(size-indication-mode -1)

;; Make the fringe (gutter) smaller
;; the argument is a width in pixels (the default is 8)
(if (fboundp 'fringe-mode)
    (fringe-mode 8))

;; Enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; More useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("Balaji's " invocation-name " @ " (:eval (if (buffer-file-name)
                                            (abbreviate-file-name (buffer-file-name))
                                          "%b"))))

;; Wrap long lines at word boundaries
(visual-line-mode)

;; END Editor UI settings;; Revert buffers automatically when underlying files are changed externally?
(global-auto-revert-mode t)

;; How to deal with tabs
;; (setq-default indent-tabs-mode t)
;; (setq-default tab-width 4)

;; Add newlines when moving past end of file
(setq next-line-add-newlines t)

;; Meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

(provide 'setup-defaults)













