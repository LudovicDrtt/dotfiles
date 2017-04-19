;;
;;    Emacs configurations
;;

;; Set the character encoding
(set-language-environment "UTF-8")

;; Make indentation commands to space only (never tab character)
(setq-default indent-tabs-mode nil)

;; Turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)

;; Auto close bracket insertion
(electric-pair-mode 1)


;;--------------------------------------------------
;;
;;    MELPA package repository configuration
;;

;; Install MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; Package init
(add-to-list 'load-path "~/.emacs.d/elpa")


;;--------------------------------------------------
;;
;;   Appearance configuration
;;

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable the scroll bar
(scroll-bar-mode -1)

;; Display the line numbers on the left
(global-linum-mode 1)

;; Display the cursor line and the column numbers in the mode line
(line-number-mode t)
(column-number-mode t)

;; Display the clock in the mode line
(display-time-mode t)

;; Change the windows title to the name of the opened file
(setq frame-title-format
      '(buffer-file-name
	"%f"
	(dired-directory dired-directory "%b")))

;; Load theme
(require 'seti-theme)
(load-theme 'seti t)


;;--------------------------------------------------
;;
;;    User keybinds configuration
;;

(global-set-key (kbd "C-c r") 'replace-string)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-c i") 'indent-region)
(global-set-key (kbd "C-c e") 'electric-pair-mode)
(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)


;;--------------------------------------------------
;;
;;    Auto-package-update configuration
;;

(require 'auto-package-update)

;; Update at startup
(auto-package-update-maybe)

;; Remove old version of the update packages
(setq auto-package-update-delete-old-versions t)


;;--------------------------------------------------
;;
;;    Icomplete configuration
;;

;; Enable icomplete
(icomplete-mode 99)

;; Load icomplete+
(eval-after-load "icomplete" '(progn (require 'icomplete+)))

;;--------------------------------------------------
;;
;;   Auto-complete configuration
;;

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)


;; Add c-headers to ac
(require 'auto-complete-c-headers)
(add-to-list 'ac-sources 'ac-sources-c-headers)

;; Flyspell compatibility
(ac-flyspell-workaround)


;;--------------------------------------------------
;;
;;    Multiple cursors configuration
;;

(require 'multiple-cursors)

;; Set the keybinds
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m d") 'mc/remove-current-cursor)


;;--------------------------------------------------
;;
;;    C mode configuration
;;

;; Set the indentation style to bsd
(setq c-default-style "bsd")

;; Set the indentation level
(setq c-basic-offset 4)


;;--------------------------------------------------
;;
;;    flyspell mode configuration
;;

(require 'flyspell-correct-popup)
(define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-previous-word-generic)


;;--------------------------------------------------
;;
;;    Latex mode configuration
;;

;; Start auto fill minor mode
(add-hook 'latex-mode-hook 'turn-on-auto-fill)

;; Start flyspell
(add-hook 'latex-mode-hook 'flyspell-mode)

;;--------------------------------------------------
;;
;;    Auctex mode configuration
;;

;; Start auto fill minor mode
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

;; Start flyspell
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; Start auto-complete
(require 'auto-complete-auctex)
(add-hook 'LaTeX-mode-hook 'auto-complete-mode)

;; Start latex-unicode-math-mode
;(require 'latex-unicode-math-mode)
;(add-hook 'LaTeX-mode-hook 'latex-unicode-math-mode)

;; Enable parsing
(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.

;;--------------------------------------------------
;;
;;    Org mode configuration
;;

;; Start auto fill minor mode
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Start flyspell
(add-hook 'org-mode-hook 'flyspell-mode)

;; Add auto completion
(add-to-list 'ac-modes 'org-mode)

;; Set maximum indentation for description lists
(setq org-list-description-max-indent 5)

;; Prevent demoting heading also shifting text inside sections
(setq org-adapt-indentation nil)

(setq org-footnote-auto-adjust t)

;; Languages support by org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   ))

;; Org latex class
(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("pkginclude-article"
               "\\documentclass{article}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage[francais]{babel}
\\usepackage{graphicx}
\\usepackage{wrapfig}
\\usepackage{longtable}
\\usepackage{hyperref}
\\usepackage{amssymb}
\\usepackage{amsmath}
\\usepackage{tikz, tkz-tab}
\\usepackage[nottoc, notlof, notlot]{tocbibind}
\\usepackage{geometry}
\\geometry{a4paper, left=2.5cm, top=2cm, right=2.5cm, bottom=2cm, marginparsep=7pt}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


;; Set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;; File to save todo items
(setq org-agenda-files (quote ("~/todo.org")))

;; Set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

;; Set colours for priorities
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

;; Open agenda in current window
(setq org-agenda-window-setup (quote current-window))

;; Capture todo items using C-c c t
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/todo.org" "Tasks")
         "* TODO [#A] %?
SCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))
DEADLINE: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))")))

;; Warn me of any deadlines in next 7 days
(setq org-deadline-warning-days 7)

;; Show me tasks scheduled or due in next fortnight
(setq org-agenda-span (quote fortnight))

;; Don't show tasks as scheduled if they are already shown as a deadline
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)

;; Don't give awarning colour to tasks with impending deadlines
;; if they are scheduled to be done
(setq org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))

;; Don't show tasks that are scheduled or have deadlines in the
;; normal todo list
(setq org-agenda-todo-ignore-deadlines (quote all))
(setq org-agenda-todo-ignore-scheduled (quote all))

;; Sort tasks in order of when they are due and then by priority
(setq org-agenda-sorting-strategy
  (quote
   ((agenda deadline-up priority-down)
    (todo priority-down category-keep)
    (tags priority-down category-keep)
    (search category-keep))))



;;--------------------------------------------------
;;
;;    Custon auto configurations
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ac-math latex-unicode-math-mode auctex auto-complete-auctex julia-mode gnuplot-mode seti-theme seq ppd-sr-speedbar pos-tip mc-extras math-symbol-lists markdown-mode let-alist jinja2-mode icomplete+ haskell-snippets haskell-mode flyspell-correct-popup elixir-mode cmake-mode auto-package-update auto-complete-clang auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
