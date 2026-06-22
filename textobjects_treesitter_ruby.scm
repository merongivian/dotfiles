;;symlink: ~/.config/nvim/queries/ruby/textobjects.scm

;; extends
;; This modeline tells Neovim to add these blocks to Ruby's default textobjects

;; ============================================================================
;; 1. Core Ruby Mappings (Fixes dam, dim, dac, dic)
;; ============================================================================

;; Methods / Functions
(method) @function.outer
(method _ @function.inner)

(singleton_method) @function.outer
(singleton_method _ @function.inner)

;; Classes
(class) @class.outer
(class _ @class.inner)

(module) @class.outer
(module _ @class.inner)

;; Ruby do ... end blocks
(do_block) @block.outer
(do_block (_)* @block.inner)

;; Curly brace blocks { ... }
(block) @block.outer
(block (_)* @block.inner)

;; Loops, Conditionals, and Control Statements (if, unless, while, until, case, for)
(if) @block.outer
(if _ @block.inner)

(unless) @block.outer
(unless _ @block.inner)

(while) @block.outer
(while _ @block.inner)

(until) @block.outer
(until _ @block.inner)

(case) @block.outer
(case _ @block.inner)

(for) @block.outer
(for _ @block.inner)

;; ============================================================================
;; 2. Custom RSpec Test Suite Mappings
;; ============================================================================

(call
  method: (identifier) @id (#eq? @id "it")
  block: (do_block)
) @rspec.it.outer

;; Match RSpec "describe" blocks
(call
  method: (identifier) @id (#eq? @id "describe")
  block: (do_block)
) @rspec.describe.outer

;; Match RSpec "context" blocks
(call
  method: (identifier) @id (#eq? @id "context")
  block: (do_block)
) @rspec.context.outer
