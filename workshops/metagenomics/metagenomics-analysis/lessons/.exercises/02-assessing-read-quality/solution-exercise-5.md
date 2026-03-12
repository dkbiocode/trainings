# Solution: Exercise 4: Quality tests

[← Back to Exercise](./exercise-5.md)

> We can get the list of all failed tests using `grep`. 
>
> ~~~ 
> $ cd ../../dc_workshop/docs
> $ grep FAIL fastqc_summaries.txt
> ~~~
>
>
> ~~~
> FAIL    Per base sequence quality       JC1A_R1.fastq.gz             
> FAIL    Per sequence GC content JC1A_R1.fastq.gz                     
> FAIL    Sequence Duplication Levels     JC1A_R1.fastq.gz             
> FAIL    Adapter Content JC1A_R1.fastq.gz                             
> FAIL    Per base sequence quality       JC1A_R2.fastq.gz             
> FAIL    Per sequence GC content JC1A_R2.fastq.gz                     
> FAIL    Sequence Duplication Levels     JC1A_R2.fastq.gz             
> FAIL    Adapter Content JC1A_R2.fastq.gz                             
> FAIL    Per base sequence content       JP4D_R1.fastq     
> FAIL    Adapter Content JP4D_R1.fastq                     
> FAIL    Per base sequence quality       JP4D_R2.fastq.gz  
> FAIL    Per base sequence content       JP4D_R2.fastq.gz  
> FAIL    Adapter Content JP4D_R2.fastq.gz
> ~~~

---

[← Back to Lesson](../../02-assessing-read-quality.md#exercise-4-quality-tests)
