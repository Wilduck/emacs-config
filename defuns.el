;;
;; Individual functions I've written
;;


;; LaTeX keybindings
(defun insert-dollar-pair ()
  "Insert a pair of dollar signs at point, then move point
between them."
  (interactive)
  (insert "$$")
  (backward-char 1)
)
(defun enter-display-math ()
  "Insert the LaTeX display-math environment amd move the point
inside of it."
  (interactive)
  (if (not (equal (current-column) 0))
      (insert "\n\n"))
  (insert "    \\[\n")
  (insert "    \n")
  (insert "    \\]\n")
  (backward-char 8)
)

;; What file am I looking at.
(defun what-file () (interactive) (message (buffer-file-name)))

;; Django Template function
(defun insert-new-django-block ()
  "Insert a new block statement, move point to block name."
  (interactive)
  (insert "{% block %}{% endblock %}")
  (backward-char 16)
)

;; Wrap a single line.
(defun wrap-line ()
  "Wrap a line to 72 characters or less"
  (interactive)
  (move-to-column 72)
  (if (and (not (equal (char-after) " "))
           (not (equal (char-before) " ")))
      (backward-word))
  (backward-word)
  (forward-word)
  (insert "\n")
  (funcall indent-line-function)
  (end-of-line)
)
(defun wrap-line-indent ()
  "Wrap a line to 72 characters than indent it by four."
  (interactive)
  (wrap-line)
  (back-to-indentation)
  (insert "    ")
  (end-of-line)
)

;; Run-commented
(defun run-commented ()
  "Uncommnet, run, recomment a paragraph"
  (interactive)
  (mark-paragraph)
  (exchange-point-and-mark)
  (backward-char)
  (uncomment-region (region-beginning) (region-end))
  (call-interactively (key-binding (kbd "C-M-x")))
  (comment-region (region-beginning) (region-end))
)

(provide 'defuns)
