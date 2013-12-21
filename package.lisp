;;;; package.lisp

(defpackage #:file-io
  (:use #:cl)
	(:nicknames #:file-io)
	(:export #:slurp-file
           #:spit-file))

