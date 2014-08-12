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

(define-derived-mode gildas-mode f90-mode "Gildas"
  "Major mode for gildas.")

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
  "Gildas polymode."
  :group 'polymodes
  :type 'object)

(define-polymode poly-gildas-mode pm-poly/gildas)

(provide 'gildas-mode)
