;;; init-ace --- Initialize ace.

;;; Commentary:

;;; My ace.

;;; Code:

(require 'use-package)

(eval-when-compile
  (require 'org))

(use-package avy
  :ensure t
  :bind ("C-c SPC" . avy-goto-word-1)
  :init
  (setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        avy-style 'at)
  :config
  (progn
    (avy-setup-default)
    (with-eval-after-load 'org
      (bind-keys :map org-mode-map
                 ("C-c SPC" . avy-goto-word-1)))))

(use-package ace-window
  :ensure t
  :bind (("M-SPC" . ace-window)
         ("s-SPC" . ace-window))
  :config
  (progn
    (setq aw-keys avy-keys
          aw-dispatch-always t
          aw-dispatch-alist
          '((?x aw-delete-window " Ace - Delete Window")
            (?c aw-swap-window " Ace - Swap Window")
            (?n aw-flip-window)
            (?v aw-split-window-vert " Ace - Split Vert Window")
            (?b aw-split-window-horz " Ace - Split Horz Window")
            (?i delete-other-windows " Ace - Maximize Window")
            (?o delete-other-windows)
            (?b balance-windows)
            (?u winner-undo)
            (?r winner-redo)))
    (ace-window-display-mode t)))

(use-package ace-link
  :ensure t
  :init
  (progn
    (bind-keys :map org-mode-map
               ("M-o" . ace-link-org))
    (ace-link-setup-default)))

(use-package ace-jump-helm-line
  :ensure t
  :init
  (with-eval-after-load 'helm
    (bind-keys :map helm-map
               ("C-'" . ace-jump-helm-line))))

(use-package ace-jump-zap
  :ensure t
  :bind (("M-z" . ace-jump-zap-up-to-char-dwim)
         ("C-M-z" . ace-jump-zap-to-char-dwim)))

(provide 'init-ace)
;;; init-ace ends here
