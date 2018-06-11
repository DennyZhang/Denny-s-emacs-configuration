;; -*- coding: utf-8 -*-
;; File: otherpackage-setting.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2018-06-11 14:55:12>
;;
;; --8<-------------------------- separator ------------------------>8--
;;(appt-activate)
(setq appt-display-format 'window)
;;(setq appt-display-duration 3)
(setq appt-display-interval 10)
(setq appt-display-mode-line t)
;; --8<-------------------------- separator ------------------------>8--
;;Find file recursively
(load-file (concat EMACS_VENDOR "/find-recursive/find-recursive.el"))
(require 'find-recursive)
;; --8<-------------------------- separator ------------------------>8--
;; (load-file (concat EMACS_VENDOR "/log4j-mode/log4j-mode.el")) ;; TODO
(require 'log4j-mode)
(add-to-list 'auto-mode-alist '("\\.log" . log4j-mode))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/dupwords/dupwords.el"))
;; --8<-------------------------- separator ------------------------>8--
;; On top of Ido, smex provides a convenient interface to your recently
;; and most frequently used commands.
;; (load-file (concat EMACS_VENDOR "/smex/smex.el")) ;; TODO
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; ;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; --8<-------------------------- separator ------------------------>8--
;; File: otherpackage-setting.el ends here
