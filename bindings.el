;; https://github.com/hlissner/doom-emacs/blob/abfc8ced21135c1ad04a4dadd14b152311669b95/core/core-keybinds.el
;; https://github.com/syl20bnr/spacemacs/blob/c7a103a772d808101d7635ec10f292ab9202d9ee/layers/%2Bcompletion/helm/packages.el
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/config/default/+evil-bindings.el
(map! :leader
      "<left>"    #'projectile-previous-project-buffer
      "<right>"   #'projectile-next-project-buffer
      "w <up>"    #'evil-window-up
      "w <down>"  #'evil-window-down
      "w <left>"  #'evil-window-left
      "w <right>" #'evil-window-right
      "s s"       #'helm-swoop
      "p l"       #'persp-switch
      "r y"       #'helm-show-kill-ring
      "jI"        #'helm-imenu-in-all-buffers
      "hr"        #'helm-resume
      )

(map!
 "C-=" #'er/expand-region
 "C--" #'er/contract-region
 "C-n" #'evil-mc-make-and-goto-next-match
 "C-p" #'evil-mc-make-and-goto-prev-match
 )
