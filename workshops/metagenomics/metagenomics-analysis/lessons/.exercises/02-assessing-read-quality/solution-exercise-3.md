# Solution: Exercise 3: Downloading files by scp (optional)

[← Back to Exercise](./exercise-3.md)

> A) False. `codespace` is your remote user.  
> B) True. `ec2-34-238-162-94.compute-1.amazonaws.com` is the address of your remote machine  
> C) False. The current address of the file goes after the first space in the `scp` command.  
> D) True. `../../dc_workshop/results/fastqc_untrimmed_reads/*.html` is the path of the file you want to download in the remote machine. 
> E) False. `~/Desktop/fastqc_html` is a local path where your file will be downloaded.
> F) False. `:` Divides the host name of a _remote_ computer and the path of the file on the remote computer.   
>
> You should see a status output like this:
> ~~~
> JC1A_R1_fastqc.html     100%  253KB 320.0KB/s   00:00     
> JC1A_R2_fastqc.html     100%  262KB 390.1KB/s   00:00     
> JP4D_R1_fastqc.html     100%  237KB 360.8KB/s   00:00     
> JP4D_R2_fastqc.html     100%  244KB 385.2KB/s   00:00
> ~~~

---

[← Back to Lesson](../../02-assessing-read-quality.md#exercise-3-downloading-files-by-scp-optional)
