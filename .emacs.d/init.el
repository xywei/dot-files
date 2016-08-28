;; init.el by JxW. created on Jan 28 2016
;; This file does nothing but recursively load files under
;; all subdirectories of ~/.emacs/JxW_config/*/


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun recursive-subdirs (directory &optional withroot)
  "Return a unsorted list of names of directories in DIRECTORY recursively.
If WITHROOT is non-nil, also DIRECTORY will be include."
  (let (subdirs)
    (dolist (element (directory-files-and-attributes directory nil nil nil))
      (let* ((path (car element))
             (isdir (car (cdr element)))
             (ignore (or (string= path ".") (string= path ".."))))
        (if (and (eq isdir t) (not ignore))
            (let ((dir (concat directory "/" path)))
              (setq subdirs (append (cons dir subdirs)
                                    (recursive-subdirs dir)))))))
    (if (not (eq withroot nil))
        (add-to-list 'subdirs directory))
    subdirs))

;; Some files should be loaded in a specific order. Thoes files
;; are stored directly under ~/.emacs/JxW_config and loaded manually.
(load "~/.emacs.d/JxW_config/setup_el-get.el")

(dolist (dir (recursive-subdirs "~/.emacs.d/JxW_config" nil))
  (dolist (file (directory-files dir t "\.el$" nil))
    (load (file-name-sans-extension file))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized)))
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
