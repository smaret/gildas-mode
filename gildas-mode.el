;;; gildas-mode.el --- Emacs mode for Gildas

;; Copyright (C) 2014  Sébastien Maret

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(require 'polymode)

(defvar gildas-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?\! "<" st) ; begin comment
    (modify-syntax-entry ?\n ">" st) ; end comment
    st)
  "Syntax table for `gildas-mode'.")

(defconst gildas-keywords
  (regexp-opt '("\@" "begin" "break" "continue" "else" "exit" "end" "endif"
		"for" "if" "next" "on" "pause" "python" "quit" "return"
		"accept" "compute" "define" "delete" "examine" "import" "let"
		"message" "mfit" "next" "parse" "say" "sic" "sort" "symbol"
		"system" "then" "to") 'words)
  "Keywords for `gildas-mode'.")

(defconst gildas-types
  (regexp-opt '("real" "integer" "double" "logical" "character" "table"
		"header" "image" "uvtable" "structure" "fits" "alias"
		"procedure" "help" "data") 'words)
  "Types for `gildas-mode'.")

(defconst gildas-constants
  (regexp-opt '("no" "pi" "sec" "yes") 'words)
  "Constants for `gildas-mode'.")

(defvar gildas-font-lock-keywords
  `((,gildas-keywords . font-lock-keyword-face)
    (,gildas-types . font-lock-type-face)
    (,gildas-constants . font-lock-constant-face)
    ;; Fixme: this does not highlight properly functions and variables
    ;; that have an underscore in their names
    ("procedure \\(\\sw+\\)" (1 font-lock-function-name-face))
    ("let \\(\\sw+\\)" (1 font-lock-variable-name-face))
    ("define \\sw+ \\(\\sw+\\)" (1 font-lock-variable-name-face)))
  "Keyword highlighting specification for `gildas-mode'.")

(define-derived-mode gildas-mode prog-mode "Gildas"
  "Major mode for Gildas."
  :syntax-table gildas-mode-syntax-table
  (setq-local comment-start "!")
  (setq-local comment-start-skip "!+ *")
  (setq-local font-lock-defaults
	      '(gildas-font-lock-keywords)))

(defcustom pm-host/gildas
  (pm-bchunkmode "gildas"
		 :mode 'gildas-mode)
  "Gildas host chunkmode"
  :group 'hostmodes
  :type 'object)

(defcustom  pm-inner/pygildas
  (pm-hbtchunkmode "python"
                   :head-reg "^begin .*\.py"
                   :tail-reg "^end .*\.py"
		   :mode 'python-mode)
  "Python chunk."
  :group 'innermodes
  :type 'object)

(defcustom pm-poly/gildas
  (pm-polymode-one "pygildas"
                   :hostmode 'pm-host/gildas
                   :innermode 'pm-inner/pygildas)
  "Polymode for Gildas."
  :group 'polymodes
  :type 'object)

(define-polymode poly-gildas-mode pm-poly/gildas)

(provide 'gildas-mode)
