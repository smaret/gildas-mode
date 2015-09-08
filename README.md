# Gildas-mode

Gildas-mode is a major mode for editing
[Gildas](http://www.iram.fr/IRAMFR/GILDAS) scripts in GNU Emacs.
Gildas-mode is free software, licensed under the GNU GPL.

## Features

* Syntax highlighting of comments, keywords, constants, and
  user-defined variable and functions
* Indentation of `if then`, `for next`, and `begin/end procedure`
  code blocks
* Python mode for PyGildas chunks, based on polymode

## Installation

Gildas-mode requires [polymode](https://github.com/vitoshka/polymode).

Make sure to place `gildas-mode.el` somewhere in the load-path and add
the following line to your `.emacs`:

```emacs-lisp
(require 'gildas-mode)
```
