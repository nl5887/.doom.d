;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;;; https://github.com/rschmukler/doom.d/blob/master/%2Bfunctions.el

;; Place your private configuration here
(load! "bindings")

(after! company
  (setq company-idle-delay 0))

(def-package! lsp-mode
  :hook
  (go-mode . lsp)
  (python-mode . lsp)
  :commands
  lsp)

;; ;; this works
;; (defun flycheck-list-errors-only-when-errors ()
;;   (if flycheck-current-errors
;;       (flycheck-list-errors)
;;     (-when-let (buffer (get-buffer flycheck-error-list-buffer))
;;       (dolist (window (get-buffer-window-list buffer))
;;         (quit-window nil window)))))

;; (add-hook 'before-save-hook #'flycheck-list-errors-only-when-errors)

(defun flycheck-list-errors-only-when-errors ()
  (if flycheck-current-errors
      (when (not (get-buffer "*Flycheck errors*"))
        (flycheck-list-errors)
        )
    (when (get-buffer "*Flycheck errors*")
      ;; (switch-to-buffer "*Flycheck errors*")
      (kill-buffer "*Flycheck errors*")
      ;; (kill-buffer (current-buffer))
      ;; (delete-window)
      ))
  )

;; (add-hook 'flycheck-after-syntax-check-hook #'flycheck-list-errors-only-when-errors)
(add-hook 'before-save-hook #'flycheck-list-errors-only-when-errors)


(after! flycheck
   (set-popup-rules!
     '(
       ("^\\*Flycheck" :size 0.3 :ttl 0 :quit t)
      )
  )
)

(after! company-box
  (add-hook 'company-mode-hook 'company-box-mode)
)

;; disable evil escape (jk) in text mode
;; (add-to-list 'evil-mc-incompatible-minor-modes 'evil-escape-mode nil #'eq)
;;
;; (after! evil-escape
;;   (evil-escape-mode nil)
;; )

(after! evil-escape (add-to-list 'evil-escape-excluded-major-modes 'text-mode))

;; Go
(defun cfg-go-mode-hook ()
  "Hook for go mode"
  (add-hook 'before-save-hook 'gofmt-before-save) ;; format before saving

  (which-func-mode 't)

  ;; compile & run (SPC c c)
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
)
(add-hook 'go-mode-hook 'cfg-go-mode-hook)
