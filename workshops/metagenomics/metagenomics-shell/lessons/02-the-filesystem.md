<!-- If you are in VS-Code, click in this window and do Shift-Ctrl/Command-V to view      -->
<!-- rendered text and links. This will open an editor tab labeled "Preview [this file]"  -->

<p id="top" style="text-align:center";>
    <a href="01-introduction.md">&larr; Introducing the Shell</a> | <a href="03-working-with-files.md">Working with Files &rarr;</a>
</p>
    

# Navigating Files and Directories

<!-- >> Teaching: 30 min | Exercises: 20 min -->

## Questions

- How can I perform operations on files outside of my working directory?

- What are some navigational shortcuts I can use to make my work more efficient?


## Objectives

- Use a single command to navigate multiple steps in your directory structure, including moving backwards (one level up).

- Perform operations on files in directories outside your working directory.

- Work with hidden directories and hidden files.

- Interconvert between absolute and relative paths.

- Employ navigational shortcuts to move around your file system.



## Moving around the file system

We've learned how to use `pwd` to find our current location within our file system. 
We've also learned how to use `cd` to change locations and `ls` to list the contents
of a directory. Now we're going to learn some additional commands for moving around 
within our file system.

Use the commands we've learned so far to navigate to the `dc_workshop/data/untrimmed_fastq` directory, if you're not already there. 

~~~
$ cd
$ cd dc_workshop
$ cd data
$ cd untrimmed_fastq
~~~

What if we want to move back up and out of this directory and to our top level 
directory? Can we type `cd dc_workshop`? Try it and see what happens.

~~~
$ cd dc_workshop
~~~

~~~
-bash: cd: dc_workshop: No such file or directory
~~~

Your computer looked for a directory or file called `dc_workshop` within the 
directory you were already in. It didn't know you wanted to look at a directory level
above the one you were located in. 

We have a special command to tell the computer to move us back or up one directory level. 

~~~
$ cd ..
~~~


Now we can use `pwd` to make sure that we are in the directory we intended to navigate
to, and `ls` to check that the contents of the directory are correct.

~~~
$ pwd
~~~

~~~
/home/codespace/dc_workshop/data
~~~

From this output, we can see that `..` did indeed take us back one level in our file system. 

You can chain these together to move several levels:

~~~
$ cd ../../..
~~~

> ## Exercise 1: Finding hidden directories
>
> First navigate to the `dc_workshop` directory. There is a hidden directory within this directory. Explore the options for `ls` to 
> find out how to see hidden directories. List the contents of the directory and 
> identify the name of the text file in that directory.
> 
> Hint: hidden files and folders in Unix start with `.`, for example `.my_hidden_directory`

>
> **[View Exercise with Solution](.exercises/02-the-filesystem/exercise-1.md)**>

[See Solution to Exercise 1](.exercises/02-the-filesystem/lesson-2-exercise-1-solution.md)


### File permissions

Another option that the `ls` command has is to check the permissions on a file. If we are organized and we have a folder with the backup of all our files, we can rescue files that we have accidentally deleted, for example, but just because we have two copies doesn't make us safe. We can still accidentally delete or overwrite both copies. To make sure we can't accidentally mess up a file, we're going to change the permissions on the file so that we're only allowed to read (i.e. view) the file, not write to it (i.e. make new changes).

View the current permissions on a file using the `-l` (long) flag for the `ls` command. 

~~~
$ ls -l
~~~

~~~
total 0
-rw-rw-r-- 1 codespace codespace 0 May 27 23:16 youfoundit.txt
~~~

The first part of the output for the `-l` flag gives you information about the file's current permissions. There are ten slots in the
permissions list. The first character in this list is related to file type, not permissions, so we'll ignore it for now. The next three
characters relate to the permissions that the file owner has, the next three relate to the permissions for group members, and the final
three characters specify what other users outside of your group can do with the file. We're going to concentrate on the three positions
that deal with your permissions (as the file owner). 

<img src="../fig/02-02-01.svg" width="652" alt="The file permission parameters described in the text (-rw-rw-r--) showing which of the slots correspond to who has permissions, and a legend showing the meaning of the letters."/>

Here the three positions that relate to the file owner are `rw-`. The `r` means that you have permission to read the file, the `w` 
indicates that you have permission to write to (i.e. make changes to) the file, and the third position is a `-`, indicating that you 
don't have permission to carry out the ability encoded by that space (this is the space where `x` or executable ability is stored, we'll 
talk more about this in [a later lesson](https://carpentries-lab.github.io/metagenomics-shell/05-writing-scripts/index.html)).

Our goal for now is to change permissions on this file so that you no longer have `w` or write permissions. We can do this using the `chmod` (change mode) command and subtracting (`-`) the write permission `-w`. 

~~~
$ chmod -w youfoundit.txt 
$ ls -l 
~~~

~~~
total 0
-r--r--r-- 1 codespace codespace 0 May 27 23:16 youfoundit.txt
~~~

## Absolute vs. relative paths

The `cd` command takes an argument which is a directory
name. Directories can be specified using either a *relative* path or a
full *absolute* path. The directories on the computer are arranged into a
hierarchy. The full path tells you where a directory is in that
hierarchy. Navigate to the home directory, then enter the `pwd`
command.

~~~
$ cd  
$ pwd  
~~~

You will see:

~~~
/home/codespace
~~~

This is the full name of your home directory. This tells you that you
are in a directory called `codespace`, which sits inside a directory called
`home` which sits inside the very top directory in the hierarchy. The
very top of the hierarchy is a directory called `/` which is usually
referred to as the *root directory*. So, to summarize: `codespace` is a
directory in `home` which is a directory in `/`.

Now enter the following command:

~~~
$ cd /home/codespace/dc_workshop/.hidden
~~~

This jumps forward multiple levels to the `.hidden` directory. 
Now go back to the home directory. 

~~~
$ cd 
~~~

And then
~~~
$ cd dc_workshop/.hidden
~~~


These two commands have the same effect, they both take us to the `.hidden` directory.
The first one uses the absolute path, giving the full address from the home directory. The
second uses a relative path, giving only the address from the working directory. A full
path always starts with a `/`. A relative path does not.

A relative path is like getting directions from someone on the street. They tell you to
"go right at the stop sign, and then turn left on Main Street". That works great if
you're standing there together, but not so well if you're trying to tell someone how to
get there from another country. A full path is like GPS coordinates. It tells you exactly
where something is no matter where you are right now.

You can usually use either a full path or a relative path
depending on what is most convenient. If we are in the home directory,
it is more convenient to enter the relative path since it
involves less typing.

Over time, it will become easier for you to keep a mental note of the
structure of the directories that you are using and how to quickly
navigate amongst them.

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
> <img src="../fig/filesystem-challenge.svg" alt="Filesystem diagram with folders: Users/thing/backup/2012-12-02, Users/thing/backup/2012-01-08, Users/thing/backup/2013-01-27, Users/backup/original, Users/backup/pnas_final, and Users/backup/pnas_sub" />

>
> **[View Exercise with Solution](.exercises/02-the-filesystem/exercise-2.md)**> 

> [See Solution to Exercise 2](.exercises/02-the-filesystem/lesson-2-exercise-2-solution.md) 


The commands `cd`, and `cd ~` are very useful for quickly navigating back to your home directory. We will be using the `~` character in later lessons to specify our home directory.

---

## Key Points
- The `/`, `~`, and `..` characters represent important navigational shortcuts.
- Hidden files and directories start with `.` and can be viewed using `ls -a`.
- Relative paths specify a location starting from the current location, while absolute paths specify a location from the root of the file system.

---

<p id="top" style="text-align:center";>
    <a href="01-introduction.md">&larr; Introducing the Shell</a> | <a href="03-working-with-files.md">Working with Files &rarr;</a>
</p>
    
