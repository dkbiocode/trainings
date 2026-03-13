## Lesson 2 Exercise 1 Solution

[Back to exercise 1](../../02-the-filesystem.md#exercise-1-finding-hidden-directories)

> ## Exercise 1: Finding hidden directories
>
> First navigate to the `dc_workshop` directory. There is a hidden directory within this directory. Explore the options for `ls` to 
> find out how to see hidden directories. List the contents of the directory and 
> identify the name of the text file in that directory.
> 
> Hint: hidden files and folders in Unix start with `.`, for example `.my_hidden_directory`
>

> ## Solution
>
> First use the `man` command to look at the options for `ls`. 
> ~~~
> $ man ls
> ~~~
> 
> 
> The `-a` option is short for `all` and says that it causes `ls` to "not ignore
> entries starting with ." This is the option we want. 
> 
> ~~~
> $ ls -a
> ~~~
> 
> 
> ~~~
>.  ..  data  .hidden  mags  taxonomy
> ~~~
> 
> 
> The name of the hidden directory is `.hidden`. We can navigate to that directory
> using `cd`. 
> 
> ~~~
> $ cd .hidden
> ~~~
> 
> 
> And then list the contents of the directory using `ls`. 
> 
> ~~~
> $ ls
> ~~~
> 
> 
> ~~~
> youfoundit.txt
> ~~~
> 
> 
> The name of the text file is `youfoundit.txt`.
> 
