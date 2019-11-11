(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq inhibit-startup-screen t)
(load-theme 'dracula t)
(require 'spaceline-config)
(spaceline-spacemacs-theme)

(set-face-attribute 'default nil
                    :family "Inconsolata" :height 145 :weight 'normal)

(define-skeleton insert-org-entry
  "Prompt for task, estimate and category"
  nil
  '(setq task  (skeleton-read "Task: "))
  '(setq estimate  (skeleton-read "Estimate: "))
  '(setq category (skeleton-read "Category: "))
  '(setq timestamp (format-time-string "%s"))
  "** " task \n
  ":PROPERTIES:" \n
  ":ESTIMATED: " estimate \n
  ":ACTUAL:" \n
  ":OWNER: sidntrivedi" \n
  ":ID: " category "." timestamp \n
  ":TASKID: " category "." timestamp \n
  ":END:")

(defun org-update-actuals ()
  (interactive)
  (org-entry-put (point) "ACTUAL"
                 (format "%0.2f" (/ (org-clock-sum-current-item) 60.0))))

(global-set-key (kbd "C-c s c") 'org-update-actuals)

(defun with-no-drawer (func &rest args)
  (interactive "P")
  (let ((org-log-into-drawer (not (car args))))
    (funcall func)))

(advice-add 'org-add-note :around #'with-no-drawer)


;; ELPA Code from here
(global-set-key (kbd "C-c s c") 'org-update-actuals)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("947190b4f17f78c39b0ab1ea95b1e6097cc9202d55c73a702395fc817f899393" default)))
 '(package-selected-packages (quote (spaceline powerline dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
