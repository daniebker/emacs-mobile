 ;;;;
 ;; ORG-MODE
 ;;;;
 
(require 'org)
(require 'org-habit)

(add-to-list 'org-modules 'org-habit)

(setq org-todo-keywords
      '((sequence "TODO" "NEXT" "IN-PROGRESS" "WAITING" "DONE")))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/notes/diary/gtd.org" "_inbox")
         "** TODO %?\n %U\n")
        ("f" "Food Log" entry (file+datetree+prompt "~/notes/diary/food.org")
         "* %?\n%T\n%^{Meal}p%^{Type}p")
        ("c" "Check in" entry (file+datetree+prompt "~/notes/diary/log.org")
                "* %?\n%T\n%^{Grateful}p%^{Feel}p%^{Health}p")
        ("g" "Garden" entry (file+datetree+prompt "~/notes/diary/garden.org")
                "* %?\n%T\n%^{Activity}p%^{State}p")))

;;;;
;; KEY MAPPINGS
;;;;

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-refile-targets
      '(("gtd.org" :maxlevel . 1)
        ("done.org" :maxlevel . 1)
        ("someday.org" :maxlevel . 1)))

;;;;
;; AGENDA
;;;;

(setq org-agenda-custom-commands
      '(("w" "WORK" tags-todo "WORK"
         ((org-agenda-overriding-header "work")))
        ("l" "LUNCHTIME" tags-todo "LUNCHTIME"
         ((org-agenda-overriding-header "Lunch")))
        ("h" "HOME" tags-todo "HOME"
         ((org-agenda-overriding-header "Home")))))

;; Show {x} days total
;; Starting from today
;; With {x} days look back
(setq org-agenda-span 4
      org-agenda-start-on-weekday nil
      org-agenda-start-day "-1d")
