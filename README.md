gildas-mode is a major mode for editing [Gildas][] scripts in GNU
Emacs.  gildas-mode is free software, licensed under the GNU GPL.

 [Gildas]: http://www.iram.fr/IRAMFR/GILDAS

Features:

   * Syntax highlighting based on f90-mode
   * Python mode for PyGildas chunks, based on polymode

Installation:

gildas-mode requires [polymode].

  [Polymode]: https://github.com/vitoshka/polymode

Make sure to place `gildas-mode.el` somewhere in the load-path and add
the following lines to your `.emacs` file to associate gildas-mode
with `.class`, `.greg`, and `.map` files:

	(require 'gildas-mode)
    (add-to-list 'auto-mode-alist '("\\.class\\'" . poly-gildas-mode))
    (add-to-list 'auto-mode-alist '("\\.greg\\'" . poly-gildas-mode))
    (add-to-list 'auto-mode-alist '("\\.map\\'" . poly-gildas-mode))

