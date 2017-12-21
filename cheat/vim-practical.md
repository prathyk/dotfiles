# Vim Practical book


## 1. Two for the price of one
Commmand | Equivalent 
------------ | -------------
C | c$
S | ^C
s | cl


## 2. Repeat Command
Intent			| Act					| Repeat	| Reverse 
-------			|-----					|--------	|--------
Make a change	| {edit}				| .		 	| u
Scan char	  	| f{c}/t{c}/F{c}/T{c}	| ;		 	| ,
search			| /{x} ?{x}				| n			| N
Replace			| :s/pattern/replace	| &			| u
Macro			| qx{changes}q			| @x		| u


## 3. Using Dot
To use the power of dot use __one command to move__ and __one command to edit__.
Example: Use `daw` instead of `bdw`


## 4. When should you switch to normal mode
At logical end. or anytime you stop to think. or as frequently anyways


## 5. To Count or Not?
	a. Instead of counting the no of words to delete, just use dw and . multiple times


## 6. Counting
Use `C-a` to increment and `C-x` to decrement the number in the line


## 7. Some operators
*  `c` change
*  `d` delete
*  `y` yank
*  `gu` switch to lower
*  `gU` switch to upper
*  `g~` switch case
*  `<` shift left
*  `>` shift right
*  `=` auto indent
*  `!` filter 
*  `v` visual 


## 8. Using operators
* you can operate on a text object
* you can operate on a motion from cursor
* you can operate on the current line by repeating. Example `gUgU` SHOUTS the current line.


## 9. Shortcuts in Insert Mode
| Command  | Action             |
| -------- | -----------------  |
| `C-h`    | backspace          |
| `C-w`    | delete word back   |
| `C-u`    | delete line back   |
| `C-[`    | back to normal     |
| `C-o`    | Insert Normal mode |

## 10. Pasting in Insert Mode
 | Command        | Action                                     |
 | -------        | ------                                     |
 | `C-r{char}`    | Paste from register character by character |
 | `C-rC-p{char}` | Paste from register preserve formatting    |


## 11. Vim-Table mode
| Command                   | Action                       |
|---------------------------|------------------------------|
| `{leader}tm`              | Enter table mode             |
| `{leader}tt`              | Tableize                     |
| `{leader}T`               | Tableize with pattern        |
| `:Tableize/;              | Tableize with ; as delimiter |
| <code>&#124; </code>      | delimit column               |
| <code>&#124;&#124;</code> | insert dashed line           |
| <code>[&#124;</code>      | move to prev column          |
| <code>]&#124;</code>      | move to next column          |
| <code>{&#124;</code>      | move to up column            |
| <code>}&#124;</code>      | move to down column          |
| `{leader}tdd`             | delete row                   |
| `{leader}tdc`             | delete column                |


## 12. Scrolling
| Command | Action                |
|---------|-----------------------|
| `C-y`   | scroll up one line    |
| `C-e`   | scroll down one line  |
| `C-u`   | scroll up half page   |
| `C-d`   | scroll down half page |
| `C-b`   | scroll up full page   |
| `C-f`   | scroll down full page |


## 13. editing markdown
* Use `Dispatch! grip --user prathyk@gmail.com --pass Apple12\# -b %` for preview of file in html <br/>
* Use `cheat` to edit or create a cheat <br/>
* Use `cheatedit` to edit a cheat <br/>
* Use `cheatgrip` to open cheat using grip <br/>
* Use `cheatless` to open cheat with mdless <br/>

## 14. Expression Register
`=` is a special register for doing back of the envelop calculations


## 15. Insert Special character
`C-v{input}` to insert special char in insert mode. <br/>
`{input}` can be:
* 3 digit decimal
* `uxxxx` four digit hexadecimal
* `c` a literal char
* `xx` a digraph; Look at :digraphs or :h digraph-table for details;


## 16. Replace mode
| Command    | Action                                                          |
|------------|-----------------------------------------------------------------|
| `R` , `r`  | Replace mode, replaces characters                               |
| `gR`, `gr` | Replaces screen realestate. tab is considered multi space here. |


## 17. Visual mode
| Command | Action                                               |
|---------|------------------------------------------------------|
| `v`     | character visual                                     |
| `V`     | line visual                                          |
| `C-v`   | Block visual mode                                    |
| `o`     | Go to the other end of selection                     |
| `.`     | Repeat the same visual command on the same selection |
| `A`     | Append                                               |
| `I`     | Insert                                               |


## 18. Command Line
* The following are three ways to enter Command line
	* `<C-r>=`
	* `/`
	* `:`
* All insert mode commands like <C-u> etc work here
* In general Ex mode is used to operate on multiple lines at once

| Command                                         | Shorthand | Effect                                                                          |
|-------------------------------------------------|-----------|---------------------------------------------------------------------------------|
| `:[range]delete [x]`                            | `d`       | Delete specified lines [into register x]                                        |
| `:[range]yank [x]`                              | `y`       | Yank specified lines [into register x]                                          |
| `:[line]put [x]`                                | `pu`      | Put the text from register x after the specified line                           |
| `:[range]copy {address}`                        | `t`       | Copy the specified lines to below the line specified by {address}               |
| `:[range]move {address}`                        | `m`       | Move the specified lines to below the line specified by {address}               |
| `:[range]join`                                  | `j`       | Join the specified lines                                                        |
| `:[range]normal {commands}`                     | `norm`    | Execute Normal mode {commands} on each speci-fied line                          |
| `:[range]substitute/{pattern}/{string}/[flags]` | `s`       | Replace occurrences of {pattern} with {string} on each specified line           |
| `:[range]global/{pattern}/[cmd]`                | `g`       | Execute the Ex command [cmd] on all specified lines where the {pattern} matches |

* `{address}` can be one of the following:
	* A line number. for example, `:3p` prints the third line
	* A range of lines like in `:2,5p`
	* `.` indicating current line, `$` for last line in file, `%` for all lines in file
	* '<,>' for visual selection
	* A line which matches pattern. `:/something/,/otherthing/p` prints all lines ranging the line which match those patterns
	* Offset. `:/<html>/+1,/<\/html>/-1p` prints entire inside of html tag. Note offset is of form {address}+n.
	* refer to the below table

| Symbol | Address                                     |
|--------|---------------------------------------------|
| `1`    | "Firs line of the file"                     |
| `$`    | "Last line of the file"                     |
| `0`    | "Virtual line above first line of the file" |
| `.`    | "Line where the cursor is placed"           |
| `'m`   | "Line containing mark m"                    |
| `'<`   | "Start of visual selection"                 |
| `'>`   | "End of visual selection"                   |
| `%`    | "The entire file (shorthand for :1,$)"      |

* Examples
	* `:6t.` will copy the 6th line after the current line.
	* `:t.` will duplicate the current line
	* `:t$` will copy the current line to end of file
	* `:'<,'>t0` will copy the selection to beginning of the file
* **Note that these command do not use a register unless specified**
* `:%norm i//` would comment the entire file. Note that the norm command would run with cursor position at beginning of each line
* `:%norm @q` would run the macro on each line of the file
* `<C-r><C-w>` copies the current word under the cursor in to the command line
* `<C-p> and <C-n>` to search through the ex command history
* Command line Window
	| Command | Effect                                                    |
	|---------|-----------------------------------------------------------|
	| `q:`    | open the magical command-line window with all ex commands |
	| `q/`    | same as above for all search history                      |
	| `<C-f>` | switch from command line mode to command-line window      |

	* Use this Command line window to edit previous commands and make a new command. 
* You can run any shell command by doing `!{cmd}`.
* Use `:shell` to temporarily execute many shell commands. 
* Use `:read !{cmd}` to read output of a command in to buffer. 
* Use `:write !{cmd}` to write contents of buffer as input to command
* `:write !sh` executes each line in the buffer as a command
* You can filter range of lines through an external command by `:[range]!{filter}`
* `!{motion}` gets you to ex mode with selected range to be applied on a filter command
* You can write a range of lines in the buffer as input to shell command by `:[range]write !{cmd}`
* Note that if you only give a range, then vim filters that range through the shell command.

## 19. Folding
| Command          | Effect                                           |
|------------------|--------------------------------------------------|
| `zr`             | open folding by one level irrespective of cursor |
| `zR`             | open folding by all levels                       |
| `zm`             | close folding one level                          |
| `zM`             | close all levels                                 |
| `zo`             | open fold under cursor                           |
| `zc`             | close current folding                            |
| `za`             | toggle folding at cursor                         |
| `zA or zC or zO` | apply for all folding levels                     |


## 20. File
