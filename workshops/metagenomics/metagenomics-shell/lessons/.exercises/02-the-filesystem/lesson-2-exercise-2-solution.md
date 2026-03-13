## Lesson 2 Exercise 2 Solution

[Back to exercise 2](../../02-the-filesystem.md#exercise-2-relative-path-resolution)

> ## Exercise 2: Relative path resolution
> 
> Using the filesystem diagram below, if `pwd` displays `/Users/thing`,
> which of the following will `ls ../backup` display?
> 
> 1.  `../backup: No such file or directory`
> 2.  `2012-12-01 2013-01-08 2013-01-27`
> 3.  `2012-12-01/ 2013-01-08/ 2013-01-27/`
> 4.  `original pnas_final pnas_sub`
> 
> <img src="../../fig/filesystem-challenge.svg" alt="Filesystem diagram with folders: Users/thing/backup/2012-12-02, Users/thing/backup/2012-01-08, Users/thing/backup/2013-01-27, Users/backup/original, Users/backup/pnas_final, and Users/backup/pnas_sub" />
>

> ## Solution
>  1. No: there *is* a directory `backup` in `/Users`.
>  2. No: this is the content of `Users/thing/backup`,
>   but with `..` we asked for one level further up.
>  3. No: see previous explanation.
>    Also, we did not specify `-F` to display `/` at the end of the directory names.
>  4. Yes: `../backup` refers to `/Users/backup`.
> 

