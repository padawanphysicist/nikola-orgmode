;; Packages to be installed
(setq package-list '(org-plus-contrib htmlize s dash f))

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "org"  (concat proto "://orgmode.org/elpa/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
;; Fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; (package-install 'use-package)
;; (package-install 'org)
;; (package-install 'org-plus-contrib)
;; (package-install 'org-ref)
;; (package-install 'htmlize)
;; (package-install 'f)
;; (package-install 's)
;; (package-install 'dash)
;; (package-install 'mustache)
;; (package-install 'ht)
;; Install missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
