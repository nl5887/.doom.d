;; https://github.com/hlissner/doom-emacs/blob/develop/modules/config/default/+evil-bindings.el
(map! :leader
      "<left>"    #'projectile-previous-project-buffer
      "<right>"   #'projectile-next-project-buffer
      "w <up>"    #'evil-window-up
      "w <down>"  #'evil-window-down
      "w <left>"  #'evil-window-left
      "w <right>" #'evil-window-right
      "s s"       #'helm-swoop
      )
