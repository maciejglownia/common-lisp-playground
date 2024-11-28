# common-lisp-playground

### Introduction

This is a simple program written according to the will of the exploring Common-Lisp language.\
Also, this is a good chance to practice planning the flow of a program, based on a simple example.

### Description

The program contains an algorithm to count number of words in a sentence from a given file.
The sentence in the file should contains only lowercase words.
Special characters and numbers are not allowed, and the program informs about invalid input.
If the input data is correct, the program returns the number of unique words, e.g. 7.

Flow - what the program does step-by-step:
1. Loads Quicklisp Setup - the library manager from a hidden .quicklisp directory in the user's home,
2. Loads required library - the split-sequence library is loaded, which provides utilities for splitting strings into sequences (like lists of words)
3. Reads a given file (passed as an argument) line by line,
4. Function 1 - `validate-file-content`:
    - Validates the sentence from the file - by checking each character,\
	i. If a character is not a lowercase alphabet (a-z) or a space, it is marked as invalid,\
	ii. Collects all invalid characters, removes duplicates, and returns them.
5. Function 2 - `validate-file-content`:
    - Reads a file line by line,
    - Splits each line into words based on spaces,
    - Filters out words containing any character that isn't a lowercase alphabet,
    - Counts unique valid words using a hash table and returns the count.
6. Function 3 - `process-invalid-characters`:
    - Displays a list of invalid characters found in the file,
    - Provides a message asking the user to revise the file by removing special characters and replacing numbers with words.
7. Main Execution Block:
    - Accepts the filename as a command-line argument,
    - Calls validate-file-content to check for invalid characters:
	i. If invalid characters are found, displays them and provides revision instructions,
	ii. If no invalid characters are found, calls count-unique-words to count and print the number of unique valid words.

### Requirements

- SBLC,
- Quicklisp,
- Emacs,
- SLIME,
- REPL.

Full instruction, how to install all listed above, you can find on my blog [in this article](https://maciejglownia.com/en/how-to-start-with-common-lisp/).

###### NOTE: 
To retrieve proper result make sure the sentence is build from lower case letters only.
Other way the program return the message, that the sentence is not as it supposed to be.

###### NOTE 2:
I run this program on Linux (Ubuntu) machine.
So, the instruction above has been tested on the Linux enveironment.
Be aware, that on Windows or Mac, the requirements can be a little bit different.

Here you can find more tips:
- [Lisp-lang - Linux & Mac](https://lisp-lang.org/learn/getting-started/)
- [Portacle - a complete IDE for Common Lisp - multiplatform](https://portacle.github.io/)
- [GeeksForGeeks - Windows](https://www.geeksforgeeks.org/how-to-install-lisp-on-windows/)
- [Common-lisp in different editors](https://lispcookbook.github.io/cl-cookbook/editor-support.html)

### Usage

- Go to file loacalization, for example:
	- `cd /home/user/repos/lisp/word-count-program` - note: yours can be different,
- Make sure in the word-count-program folder, there are 3 files:
	- word-count.lisp -> a file with the program,
	- correct-sentence.txt -> a file containing example sentence, e.g.: "a horse and a dog",
	- sentence-with-chars-and-numbers.txt -> a file containing example sentence, e.g.: "a horse and a dog % 90",
	- sentence-with-uppercase-words.txt -> a file containing example sentence, e.g.: "a Horse and a Dog",
	- README.md
- Run the following (two options):
1. Directly from the CLI:
- $ `sbcl --script word-count.lisp sentence.txt`

2.Using Emacs:
- $ `emacs`
- Press: M-x (Alt + x)
- Type: slime
- Press enter, and a REPL will start,
- Load the program:
	- $ `(load "home/user/repos/lisp/word-count.lisp")`
- You should be able to see the result:
	- 4 -> because unique words are: 
		1. a 
		2. horse 
		3. and 
		4. dog

### Read more from my blog
- [Article about: SBCL, Quicklisp, Emacs, SLIME, REPL](https://maciejglownia.com/en/sbcl-quicklisp-emacs-slime-repl-some-explanation-according-to-lisp/).

### License 

This project is licensed under the MIT License.\
See the [LICENSE](https://en.wikipedia.org/wiki/MIT_License) file for details.
