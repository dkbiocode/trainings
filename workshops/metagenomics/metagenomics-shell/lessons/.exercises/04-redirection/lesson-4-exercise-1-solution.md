## Solution To Lesson 4 Exercise 1

[Back to Exercise 1](../../04-redirection.md#exercise-1-using-grep)

> ## Exercise 1: Using grep
>
> 1. Search for the sequence `GATCGAGAGGGGATAGGCG` in the `JC1A_R2.fastq` file.
> Have your search return all matching lines and the name (or identifier) for each sequence
> that contains a match.
> 
> 2. Search for the sequence `AAGTT` in all FASTQ files.
> Have your search return all matching lines and the name (or identifier) for each sequence
> that contains a match.
>

> ## Solution
> 1. To search for the GATCGAGAGGGGATAGGCG sequence in the file JC1A_R2.fastq:
> ~~~
> $ grep -B1 GATCGAGAGGGGATAGGCG JC1A_R2.fastq
> ~~~
>
> The output shows all of the lines that contain the sequence GATCGAGAGGGGATAGGCG. As the flag -B1 is used, it also shows the previous line to each occurence. In a FastQ file the identifier of each sequence is one line above the sequence itself, therefore in this example you can see the names and the sequences that match your query.
>
> 2. To search for a sequence in all of the FastQ files you could use the asterisk `*` wildcard before the file extension `.fastq` :
>~~~
> $ grep -B1 AAGTT *.fastq
>~~~  
> In this case, the lines with the sequence AAGTT are shown for all of the files that end with '.fastq' in the current directory. The output shows the name of the file followed by semicolon to differentiate what file each line comes from.
> 
> 