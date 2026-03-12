# Solution: Exercise 2: Looking at metadata about the untrimmed-files

[← Back to Exercise](./exercise-2.md)

> ~~~
>
> a) No. The flag `-a` shows all the contents, including hidden files and directories, but not the sizes.  
> b) No. The flag `-S` shows the content Sorted by size, starting with the most extensive file, but not the sizes.  
> c) Yes. The flag `-l` shows the contents with metadata, including file size. Other metadata are permissions, owners, and modification dates.    
> d) Yes. The flag `-lh` shows the content with metadata in a human-readable manner.  
> e) Yes. The combination of all the flags shows all the contents with metadata, including hidden files, sorted by size.  
> ~~~
>
>
> ~~~
> ls -ahls
> ~~~
>
>
> ~~~
> -rw-r--r-- 1 codespace codespace  24M Nov 26 21:34 JC1A_R1.fastq.gz                      
> -rw-r--r-- 1 codespace codespace  24M Nov 26 21:34 JC1A_R2.fastq.gz                      
> -rw-r--r-- 1 codespace codespace 616M Nov 26 21:34 JP4D_R1.fastq              
> -rw-r--r-- 1 codespace codespace 203M Nov 26 21:35 JP4D_R2.fastq.gz   
> ~~~
>
>
> Four FASTQ files oscillate between 24M (24MB) to 616M. The largest file is JP4D_R1.fastq with 616M.

---

[← Back to Lesson](../../02-assessing-read-quality.md#exercise-2-looking-at-metadata-about-the-untrimmed-files)
