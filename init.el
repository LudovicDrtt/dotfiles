;;
;;    Emacs configurations
;;

;; Set the character encoding
(set-language-environment "UTF-8")

;; Pull apart custom configuration
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

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
	"%f - Emacs"
	(dired-directory dired-directory "%b")))

;; Set font size
(set-face-attribute 'default nil :height 105)

;; Load theme
(load-theme 'spacemacs-dark)


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
;;    Elpy (python) mode configuration
;;
(elpy-enable)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;;--------------------------------------------------
;;
;;    Tuareg (ocaml) mode configuration
;;
(load "/home/ludovic/.opam/default/share/emacs/site-lisp/tuareg-site-file")



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

;; Always ask for the master file when creating a new TeX file.
(setq-default TeX-master nil)

;; Enable reverse search with Synctex and Okular
(setq TeX-source-correlate-mode t
      TeX-source-correlate-start-server t)

;; Set Okular as the default PDF viewer.
(eval-after-load "tex"
  '(setcar (cdr (assoc 'output-pdf TeX-view-program-selection)) "Okular"))


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


;;--------------------------------------------------
;;
;;    Evil mode configuration
;;
(require 'evil)
(evil-mode 1)

;; Adaptation des touches au bépo
 
;; Première étape: avant de réaffecter c,t,s,r en h,j,k,l, il faut retirer ces touches de l’agencement de clavier normal-state
(define-key evil-normal-state-map "c" nil)
(define-key evil-normal-state-map "C" nil)
(define-key evil-normal-state-map "s" nil)
(define-key evil-normal-state-map "S" nil)
(define-key evil-normal-state-map "r" nil)
(define-key evil-normal-state-map "R" nil)
(define-key evil-normal-state-map "j" nil)
(define-key evil-normal-state-map "J" nil)
;; je redéfinis certaines fonctions pour l’état normal
(define-key evil-normal-state-map "h" 'evil-change)
(define-key evil-normal-state-map "H" 'evil-change-line)
(define-key evil-normal-state-map "T" 'evil-join)
(define-key evil-normal-state-map "l" 'evil-replace)
(define-key evil-normal-state-map "L" 'evil-replace-state)
(define-key evil-normal-state-map "k" 'evil-substitute)
(define-key evil-normal-state-map "K" 'evil-change-whole-line)
;; Même chose mais cette fois pour l’état motion
(define-key evil-motion-state-map "c" 'evil-backward-char)
(define-key evil-motion-state-map "C" 'evil-window-top)
(define-key evil-motion-state-map "t" 'evil-next-line)
(define-key evil-motion-state-map "s" 'evil-previous-line)
(define-key evil-motion-state-map "r" 'evil-forward-char)
(define-key evil-motion-state-map "R" 'evil-window-bottom)
(define-key evil-motion-state-map "j" 'evil-find-char-to)
