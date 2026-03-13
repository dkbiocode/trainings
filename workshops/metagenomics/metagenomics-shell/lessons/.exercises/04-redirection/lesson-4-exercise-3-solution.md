## Solution to Lesson 4 Exercise 3

[Back to exercise](../../04-redirection.md#exercise-3-using-basename)

> ## Exercise 3: Using `basename`
>
> Print the file prefix of all of the `.txt` files in our current directory.
>

> ## Solution
>
> ~~~
> $ for filename in *.txt
> > do
> > name=$(basename ${filename} .txt)
> > echo ${name}
> > done
> ~~~
> 
> 