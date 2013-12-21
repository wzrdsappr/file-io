;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; file-io.lisp
;;
;;   This project provides an easy way to retrieve the contents of a file into 
;;   a sequence with a specified type and element type or store the contents of 
;;   a sequence into a file with a specified element type.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Copyright (c) 2011 Jonathan Lee
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Documentation of the code usage and purpose.
;;
;; The slurp-file function provides an easy and fast way to retrieve the contents of
;; a file.
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package #:file-io)

(defun slurp-file (pathname &key (seq-type :string) (element-type 'character)
									 (external-format :default))
  "Return the contents of file as a sequence. The sequence type is determined by
the SEQ-TYPE key and contains values read from the file of type determined by the
ELEMENT-TYPE key.

SEQ-TYPE -- one of :string, :list or :array. The default is :string.

ELEMENT-TYPE -- a type specifier for recognizable subtype of character, or a
  type specifier for a finite recognizable subtype of integer, or one of the
  symbols signed-byte, unsigned-byte or :default. The default is CHARACTER.
  This key is identical to the element-type key required by the open function
  in the Hyperspec."
  (with-open-file (strm pathname
												:element-type element-type
												:external-format external-format)
    (let* ((flen (file-length strm))
					 (seq (ecase seq-type
									(:list (make-list flen))
									(:string (make-string flen))
									(:array (make-array flen))))
					 (end (read-sequence seq strm)))
      (subseq seq 0 end))))


(defun spit-file (sequence pathname &key (element-type 'character)
									(if-exists :supersede)
									(external-format :default))
  "Creates a file from the contents of a sequence. The ELEMENT-TYPE key
determines the data type written to the file.

ELEMENT-TYPE -- a type specifier for recognizable subtype of character, or a
  type specifier for a finite recognizable subtype of integer, or one of the
  symbols signed-byte, unsigned-byte or :default. The default is CHARACTER.
  This key is identical to the element-type key required by the open function
  in the Hyperspec."
	(with-open-file (output-stream pathname
																 :direction :output
																 :element-type element-type
																 :if-exists if-exists
																 :if-does-not-exist :create
																 :external-format external-format)
		(write-sequence sequence output-stream))
	t)

;; eof
