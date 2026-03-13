## Solution to Lesson 1 Exercise 1

[Back to exercise 1](../../01-introduction.md#exercise-1-extra-information-with-ls--l)

> ## Exercise 1: Extra information with `ls -l`
> Use the `-l` option for the `ls` command to display more information for each item 
> in the directory. What is one piece of additional information this long format
> gives you that you don't see with the bare `ls` command?
>

> ## Solution
> ~~~
> $ ls -l
> ~~~
> 
> 
> ~~~
> total 12
> drwxr-xr-x 3 vscode vscode 4096 Jun  3 17:59 data
> drwxrwxr-x 2 vscode vscode 4096 Jun  3 18:02 mags
> drwxrwxr-x 3 vscode vscode 4096 Jun  3 18:25 taxonomy
> ~~~
> 
> 
> The additional information given includes the name of the owner of the file,
> when the file was last modified, and whether the current user has permission
> to read and write to the file.
> 
