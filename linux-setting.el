;; -*- coding: utf-8 -*-
;; File: linux-setting.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-03 15:37:47>
;; --8<-------------------------- separator ------------------------>8--
;; (create-fontset-from-fontset-spec
;; "-unknown-DejaVu Sans Mono-normal-normal-normal-*-16-*-*-*-m-0-fontset-startup")
(setq default-frame-alist
      (append
       '(
         ;;(font . "fontset-startup")
         (foreground-color . "Wheat")
         (background-color . "DarkSlateGray")
         (cursor-color . "Orchid")
         )
       default-frame-alist))
;; --8<-------------------------- separator ------------------------>8--
;;gnuplot
;;(add-to-list 'load-path (concat CONF-EMACS-VENDOR "/gnuplot-mode"))
;;(load-file (concat CONF-EMACS-VENDOR "/org-plot/org-plot.el"))
;;(require 'gnuplot)
;;(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
;;(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
;;(add-to-list 'auto-mode-alist '("\\.gp$" . gnuplot-mode))
;;(global-set-key [(f9)] 'gnuplot-make-buffer)
;; --8<-------------------------- separator ------------------------>8--
;;alt+p r: root edit current file
(define-key global-map (kbd "M-p r") 'open-current-file-as-root)
(defun open-current-file-as-root ()
  "Open the current buffer as unix root. This command works on unixes only."
  (interactive)
  (when buffer-file-name
    (if (string-match "/sudo:root@localhost.*" buffer-file-name)
        ;; If the file is already opened as root priveledge, revert the buffer
        (revert-buffer nil t)
      (if buffer-read-only
          ;; open file in root priveledge, if necessary
          (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))
        (revert-buffer nil t))
      )
    )
  )
;; --8<-------------------------- separator ------------------------>8--
;; (set-default-font "-bitstream-Bitstream Charter-normal-normal-normal-*-17-*-*-*-*-0-iso10646-1")
;; (setq sl/x-font-en "DejaVu Sans Mono"
;; sl/x-font-zh "文泉驿正黑"
;; ;;sl/x-font-zh "WenQuanYi Micro Hei"
;; sl/x-font-zh-size 13.5)

;; (defun sl/set-x-font ()
;; (interactive)
;; (let ((fontset "fontset-default")
;; (zh-font (font-spec :family sl/x-font-zh :size sl/x-font-zh-size)))
;; (set-default-font sl/x-font-en)
;; (set-fontset-font fontset
;; 'nil '("Courier New" . "unicode-bmp"))
;; (set-fontset-font fontset
;; 'nil '("Baekmuk Dotum" . "unicode-bmp"))
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;; (set-fontset-font fontset charset zh-font))))

;; (sl/set-x-font)
;; --8<-------------------------- separator ------------------------>8--
;; show file size and free space left in device
;;(load-file (concat CONF-EMACS-VENDOR "/df-mode/df-mode.el"))
;;(df-mode 1)
;; --8<-------------------------- separator ------------------------>8--
;; ;;Usage:M-x ascii-on RET
;; (require 'ascii)
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode))
(add-to-list 'auto-mode-alist '("\\.stata$" . stata-mode))
;;(org-defkey org-mode-map [(control meta ,)] 'org-shiftmetaleft)
;; --8<-------------------------- separator ------------------------>8--
;;(add-to-list 'load-path "~/Downloads/yasnippet-0.6.1c/")
(require 'yasnippet)
(setq yas-snippet-dirs (list (expand-file-name "snippets/" CONF-DENNY-EMACS)))
(if (string= emacs-version "25.1.1")
    (progn 
      (add-to-list 'load-path (concat CONF-EMACS-VENDOR "/yasnippet"))
      (yas/initialize)
      )
    (yas-global-mode 1))
;; (yas-load-directory yas-snippet-dirs nil) ;; TODO
;; --8<-------------------------- separator ------------------------>8--
;; (require 'desktop)
;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
;; (setq desktop-globals-to-save
;; (append '((extended-command-history . 30)
;; (file-name-history . 100)
;; (ido-last-directory-list . 100)
;; (ido-work-directory-list . 100)
;; (ido-work-file-list . 100)
;; (grep-history . 30)
;; (compile-history . 30)
;; (minibuffer-history . 50)
;; (query-replace-history . 60)
;; (read-expression-history . 60)
;; (regexp-history . 60)
;; (regexp-search-ring . 20)
;; (search-ring . 20)
;; (comint-input-ring . 50)
;; (shell-command-history . 50)
;; desktop-missing-file-warning
;; tags-file-name
;; register-alist)))
;; (add-to-list 'desktop-globals-to-save 'vc-comment-ring)
;; (setq desktop-buffers-not-to-save
;; (concat "\\(" "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
;; "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
;; "\\)$"))
;; (add-to-list 'desktop-modes-not-to-save 'dired-mode)
;; (add-to-list 'desktop-modes-not-to-save 'Info-mode)
;; (add-to-list 'desktop-modes-not-to-save 'erc-mode)
;; (add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
;; (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
;; (desktop-save-mode 1)
;; (desktop-release-lock)
;; (add-to-list 'desktop-clear-preserve-buffers "\\*eshell\\*.*")
;; (add-to-list 'desktop-clear-preserve-buffers "\\*shell\\*.*")
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat CONF-EMACS-VENDOR "/command-frequency/command-frequency.el"))
(command-frequency-mode 1)
(defvar cf-frequence-threshrold 1 "*When generating reports, only show commands over given threshrold")
(defvar cf-stat-self-insert-command nil "*Non-nil means also statistic `self-insert-command'")
(defvar cf-buffer-name "*command frequence*" "the name of buffer command frequence")

(defvar cf-command-history nil "command frequency history")

(defun cf-add-command ()
  (when (and last-command
             (or cf-stat-self-insert-command (not (equal last-command 'self-insert-command))))
    (let ((cmd (assoc last-command cf-command-history)))
      (if cmd
          (setcdr cmd (1+ (cdr cmd)))
        (add-to-list 'cf-command-history (cons last-command 1))))))

(defun command-frequence ()
  (interactive)
  (with-current-buffer (get-buffer-create cf-buffer-name)
    (linum-mode t)
    (View-quit)
    (erase-buffer)
    (let ((cmds (copy-sequence cf-command-history)) (all 0))
      (dolist (c cmds)
        (setq all (+ all (cdr c))))
      (insert (format "Total count of commands: %d. " all))
      (unless cf-stat-self-insert-command
        (insert "(exclude `self-insert-command')"))
      (insert "\n\n")
      (insert (format "%-5s %-5s %-30s %s\n" "Count" "Frequency" "Command" "Key"))
      (dolist (c (sort cmds (lambda (c1 c2) (> (cdr c1) (cdr c2)))))
        (unless (< (cdr c) cf-frequence-threshrold)
          (insert (format "%-5d %.3f %-30S %s\n" (cdr c) (/ (cdr c) (float all)) (car c)
                          (mapconcat 'key-description (where-is-internal (car c)) ", ")))))
      (goto-char (point-min))
      (setq major-mode 'emacs-lisp-mode)
      (setq mode-name "Emacs-Lisp")
      (use-local-map emacs-lisp-mode-map)
      (view-mode t)
      (switch-to-buffer (current-buffer)))))

(defun cf-clear-command-history ()
  "Clear command history"
  (interactive)
  (setq cf-command-history nil))

(add-hook 'post-command-hook 'cf-add-command)
;; (add-to-list 'desktop-globals-to-save 'cf-command-history)
;; --8<-------------------------- separator ------------------------>8--
(if (eq system-type 'gnu/linux)
    (progn
      ;; (add-to-list 'load-path (concat CONF-EMACS-VENDOR "/pomodoro")) ;; TODO
      ;; (load-file (concat CONF-EMACS-VENDOR "/pomodoro/pomodoro.el")) ;; TODO
      (pomodoro)
      (setq pomodoro-work-time 25) ;; God, I can only focus for quite a short time
      (setq pomodoro-set-number 4) ;; Number of sets until a long break
      ;; (defun pomodoro-message (msg)
      ;; "Display a message in a buffer and maybe raise emacs frame."
      ;; (when pomodoro-raise-frame
      ;; (raise-frame (selected-frame)))
      ;; (let ((this-window (selected-window)))
      ;; (with-current-buffer (get-buffer-create pomodoro-buffer-name)
      ;; (erase-buffer)
      ;; (insert msg))
      ;; (pop-to-buffer pomodoro-buffer-name)
      ;; (ding)
      ;; (sleep-for 2)
      ;; (ding)
      ;; ;; suggest not to change window height, since it will distract users' work environment
      ;; (fit-window-to-buffer)
      ;; ;; auto kill the buffer, after some wait
      ;; (run-at-time "8 sec" nil 'kill-buffer pomodoro-buffer-name)
      ;; (select-window this-window))
      ;; (run-hook-with-args 'pomodoro-message-hook msg))
      ))
;; --8<-------------------------- separator ------------------------>8--
;; File: linux-setting.el
