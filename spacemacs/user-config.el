;;
;; Replace selection (more natural)
(delete-selection-mode t)

;;
;; Make frame be able to resize to full height
(setq frame-resize-pixelwise t)

;;
;; Vertical split by default
(setq split-height-threshold nil)
(setq split-width-threshold 80)

;;
;; Disable automatic horizontal scrolling (C-x < and C-x > to do it manually)
(setq auto-hscroll-mode nil)

;; Custom layout
(spacemacs|define-custom-layout "Research Article"
  :binding "p"
  :body
  (split-window-right)
  )

;;
;; Indicate column 80
;; (add-hook 'prog-mode-hook 'turn-on-fci-mode)
;; (add-hook 'text-mode-hook 'turn-on-fci-mode)
(setq-default fill-column 80)
(setq fci-rule-width 3)
(setq fci-rule-color "darkblue")


(defun halve-other-window-width ()
  "Expand current window to use half of the other window's width."
  (interactive)
  (enlarge-window-horizontally (/ (window-width (next-window)) 2)))

;;
;; Org-mode configs
;;
(with-eval-after-load 'org
                      ;;
                      ;; Shift-Enter to open local centent and move cursor 
                      ;; Assuming only two windows at present
                      (defun org-tree-open-in-new-window ()
                             (interactive)
                             (delete-other-windows)
                             (org-tree-to-indirect-buffer)
                             (other-window 1)
                             (halve-other-window-width)
                             (rename-buffer (org-get-heading) t))
                      (define-key org-mode-map
                      [S-return] 'org-tree-open-in-new-window)
                      ;;
                      ;; Enter to open local centent and but cursor stays
                      ;; Assuming only two windows at present
                      (defun org-tree-open-in-new-window-cursor-stays ()
                             (interactive)
                             (delete-other-windows)
                             (org-tree-to-indirect-buffer)
                             (other-window 1)
                             (halve-other-window-width)
                             (rename-buffer (org-get-heading) t)
                             (other-window 1))
                      (define-key org-mode-map
                      [return] 'org-tree-open-in-new-window-cursor-stays)
                      ;;
                      ;; Allow ignoring heading while export the content 
                      ;; of subtrees
                      (require 'ox-extra)
                      (ox-extras-activate '(ignore-headlines))
) ;; end of Org-mode configs

