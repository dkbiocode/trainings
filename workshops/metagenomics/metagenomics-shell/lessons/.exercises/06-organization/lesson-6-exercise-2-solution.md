
## Solution to Lesson 6 Exercise 2

[back to exercise](../../06-organization.md#exercise-2-creating-a-record-of-the-used-commands)

> ## Exercise 2: Creating a record of the used commands 
> 
> Using your knowledge of the shell, use the append redirect `>>` to create a file called
> `workshop_log_XXXX_XX_XX.sh` (Use the four-digit year, two-digit month, and two digit day, e.g.
> `workshop_log_2021_03_25.sh`)  
>

> ## Solution
> ~~~
> $ history | tail -n 8 >> workshop_log_2021_03_25.sh
> ~~~
> 
> Note we used the last 7 lines as an example, the number of lines may vary.
> 