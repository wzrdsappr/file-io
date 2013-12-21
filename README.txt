;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   This project provides an easy way to retrieve the contents of a file into
;;   a sequence with a specified type and element type or store the contents of
;;   a sequence into a file with a specified element type.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Copyright (c) 2011 Jonathan Lee (jonathlee[at]gmail[dot]com)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Change Log
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 2006-10-02 Jonathan Lee  Original version 0.01 of slurp-file function
;; 2008-10-15 Jonathan Lee  Original version 0.01 of spit-file function
;; 2011-08-23 Jonathan Lee  Combined the two file I/O functions into a single
;;                          package for ease of reference.
;; 2013-12-20 Jonathan Lee  Improved documentation. Added markdown README file
;;                          for Github repository default page.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Loading the project
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; To load this project, use QuickLisp, ASDF or simply load the file-io.lisp file
;; in your Lisp REPL.
;;
;; (ql:quickload "file-io")
;;
;; or
;;
;; (asdf:oos 'asdf:load-file "file-io")
;;
;; or
;;
;; (load "/path/to/project/file-io/file-io.lisp")
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Documentation of the code usage and purpose.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; The slurp-file function provides an easy and fast way to retrieve the contents
;; of a file.
;;
;; The function is based on a series of tests designed by Gene Michael Stover
;; to discover the fastest method of retrieving data from a file.
;;
;; I have extended the function to allow the caller to specify what type of
;; sequence to return and what element type is used to extract the file
;; contents.
;;
;; Usage:
;; (slurp-file "/pathname/to/your/file")
;;  or
;; (slurp-file "/pathname/to/your/file" :seq-type :array :element-type 'integer)
;;  or
;; (slurp-file "/pathname/to/your/file" :seq-type :list :element-type '(byte 8))
;;
;; The spit-file function provides an easy and fast way to create a file from the
;; contents of a sequence
;;
;; Usage:
;; (spit-file "File contents sequence" "/pathname/to/your/file")
;;  or
;; (spit-file #(72 101 108 108 111) "/pathname/to/your/file" :element-type 'integer)
;;  or
;; (spit-file (list 67 111 110 116 101 110 116 115)
;;            "/pathname/to/your/file"
;;            :element-type '(byte 8)
;;            :file-exists :append)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

