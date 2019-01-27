*Diyang Wu*

### Overall Grade: 98/110

### Quality of report: 10/10

-   Is the homework submitted (git tag time) before deadline?  

    Yes. `Jan 25, 2019, 6:29 PM PST`.

-   Is the final report in a human readable format html? 

    Yes. `html`. 

-   Is the report prepared as a dynamic document (R markdown) for better reproducibility?

    Yes. `Rmd`.

-   Is the report clear (whole sentences, typos, grammar)? Do readers have a clear idea what's going on and how are results produced by just reading the report? 

	Yes. 

### Correctness and efficiency of solution: 54/60

-   Q1 (10/10)

-   Q2 (20/20)

	
	
-   Q3 (11/15)

	\#1. (-3 pts) `grep` searches  the file for  lines
       containing  a  match  to  the  given  pattern. It does not account for multiple occurrences in one line. Use option `-ow`:

	```
	grep -ow $i pride_and_prejudice.txt  | wc -l 
	```
	
	\#3. (-1 pt) Why do we need the first line of the shell script (`#!/bin/sh`)?

-  Q4 (13/15)


	\#3. (-2 pts) Table looks crude. Use `kable` to print the table in the given format. 

	    
### Usage of Git: 8/10

-   Are branches (`master` and `develop`) correctly set up? Is the hw submission put into the `master` branch?

    Yes.

-   Are there enough commits? Are commit messages clear? 

    16 commits for hw1. 
          
-   Is the hw1 submission tagged? (-1 pt)

    Tag name should be `hw1`. 

-   Are the folders (`hw1`, `hw2`, ...) created correctly? 

    Yes.
  
-   Do not put a lot auxiliary files into version control. (-1 pt)

	 Remove unncecessary files such as `hw1.Rmd` from `master` branch. 

### Reproducibility: 8/10

-   Are the materials (files and instructions) submitted to the `master` branch sufficient for reproducing all the results? Just click the `knit` button will produce the final `html` on teaching server? (-2 pts)


	Clicking knit button does not produce the final html on teaching server. 
	
	- `eval=FALSE` in code chunks prevents displaying output. 
	- `middle.sh` is missing 
	- The path `"/home/wudiyangabc/biostat-m280-2019-winter/hw1/"` in `collection.R` and `grep $i /home/wudiyangabc/pride_and_prejudice.txt | wc -l` in `hw1sol.Rmd` is for your own directory on the server. Use relative path (for example, `"./"`) for easier reproducibility. 

	
-   If necessary, are there clear instructions, either in report or in a separate file, how to reproduce the ressults?

    Yes.

### R code style: 18/20

-   [Rule 3.](https://google.github.io/styleguide/Rguide.xml#linelength) The maximum line length is 80 characters. 

	Keep coments under 80 characters as well. 


-   [Rule 4.](https://google.github.io/styleguide/Rguide.xml#indentation) When indenting your code, use two spaces.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place spaces around all binary operators (=, +, -, &lt;-, etc.). 	
	
-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place a space before a comma, but always place one after a comma. (-2 pts) 

	Some violations:
	
	- `collection.R`: line 13, 17
	- `runSim.R`: line 33, 35, 36, 42, 43

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place a space before left parenthesis, except in a function call.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place spaces around code in parentheses or square brackets.
