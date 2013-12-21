file-io
=======

Description
-----------
Provide an easy way to read from or write to files in Common Lisp.  The contents
of the file are placed into a sequence, whose type can be specified, with an
optionally specified element type as well.  The contents of a sequence can also
be stored into a file, with an optionally specified element type.

Change Log
----------
<table>
<tr><td>2006-10-02</td><td>Jonathan Lee</td><td>Original version 0.01 of slurp-file function.</td></tr>
<tr><td>2008-10-15</td><td>Jonathan Lee</td><td>Original version 0.01 of spit-file function.</td></tr>
<tr><td>2011-08-23</td><td>Jonathan Lee</td><td>Combined the two file I/O functions into a single package for ease of reference.</td></tr>
<tr><td>2013-12-20</td><td>Jonathan Lee</td><td>Improved documentation. Added markdown README file for Github repository
default page.</td></tr>
</table>

Loading the project
-------------------
To load this project, use QuickLisp, ASDF or simply load the file-io.lisp file
in your Lisp REPL.

```lisp
(ql:quickload "file-io")
```

or

```lisp
(asdf:oos 'asdf:load-file "file-io")
```

or

```lisp
(load "/path/to/project/file-io/file-io.lisp")
```

Usage
-----
The `slurp-file` function provides an easy and fast way to retrieve the contents
of a file.

The function is based on a series of tests designed by Gene Michael Stover
to discover the fastest method of retrieving data from a file.

I have extended the function to allow the caller to specify what type of
sequence to return and what element type is used to extract the file contents.

### `slurp-file` Usage:

```lisp
(file-io:slurp-file "/pathname/to/your/file")

(file-io:slurp-file "/pathname/to/your/file" :seq-type :array :element-type 'integer)

(file-io:slurp-file "/pathname/to/your/file" :seq-type :list :element-type '(byte 8))
```

The `spit-file` function provides an easy and fast way to create a file from the
contents of a sequence.

### `spit-file` Usage:

```lisp
(file-io:spit-file "File contents sequence" "/pathname/to/your/file")

(file-io:spit-file #(72 101 108 108 111) "/pathname/to/your/file" :element-type 'integer)

(file-io:spit-file (list 67 111 110 116 101 110 116 115)
                   "/pathname/to/your/file"
                   :element-type '(byte 8)
                   :file-exists :append)
```

License
-------
MIT. See "LICENSE".
