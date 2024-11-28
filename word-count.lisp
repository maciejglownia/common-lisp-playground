(load (merge-pathnames ".quicklisp/setup.lisp" (user-homedir-pathname)))

(ql:quickload "split-sequence")

(defun validate-file-content (filename)
  "Validate that the file contains only lowercase alphabetic words."
  (let ((invalid-characters '()))
    (with-open-file (stream filename)
      (do ((line (read-line stream nil) (read-line stream nil)))
          ((not line))
        (dolist (char (coerce line 'list)) ; Convert string to list of characters
          (unless (or (char<= #\a char #\z) (char= char #\Space))
            (push char invalid-characters)))))
    (delete-duplicates invalid-characters))) ; Return unique invalid characters

(defun count-unique-words (filename)
  "Counts the number of unique lowercase words in a file, assuming valid input."
  (let ((unique-words (make-hash-table :test 'equal)))
    (with-open-file (stream filename)
      (do ((line (read-line stream nil) (read-line stream nil)))
          ((not line))
        (let* ((words (remove-if-not #'(lambda (word) (every #'(lambda (char) (char<= #\a char #\z)) word))
                                     (split-sequence:split-sequence #\Space line))))
          (dolist (word words)
            (setf (gethash word unique-words) t)))))
    (hash-table-count unique-words))) ; Return the count of unique words

(defun process-invalid-characters (invalid-characters)
  "Process invalid characters and suggest fixes."
  (format t "Invalid characters found: ~a~%" invalid-characters)
  (format t "Please revise your file to remove special characters and replace numbers with words (e.g., 1 -> one).~%"))

;; Main execution block
(let* ((filename (nth 1 sb-ext:*posix-argv*))
       (invalid-characters (validate-file-content filename)))
  (if invalid-characters
      (process-invalid-characters invalid-characters)
      (format t "Unique word count: ~a~%" (count-unique-words filename))))