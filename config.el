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

(add-hook 'flycheck-after-syntax-check-hook #'flycheck-list-errors-only-when-errors)
;; (add-hook 'before-save-hook #'flycheck-list-errors-only-when-errors)

(after! flycheck
   (set-popup-rules!
     '(
       ("^\\*Flycheck" :size 0.3 :ttl 0 :quit t)
      )
  )
)
