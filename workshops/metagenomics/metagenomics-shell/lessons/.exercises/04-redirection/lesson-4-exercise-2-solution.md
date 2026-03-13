## Solution to Lesson 4 Exercise 2

[Back to exercise](../../04-redirection.md#exercise-2-using-wc)

> ## Exercise 2: Using `wc`
>
> How many sequences in `JC1A_R2.fastq` contain at least 3 consecutive Ns?
>

> ## Solution
>
> ~~~
> $ grep NNN JC1A_R2.fastq > bad_reads.txt
> $ wc -l bad_reads.txt
> ~~~
> 
> 
> ~~~
> 596 bad_reads.txt
> ~~~
> 
>
