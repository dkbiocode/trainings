# System Setup Guide and Workbook

This document is intended for you to record important details of your setup so that you can refer to them later.  This will serve as a guide to keep you oriented during the lessons.

You want to read the sections below and record in your notes the following:

* My home directory is:
* My project root is:
* My parallel threads available:

### Your home directory

Most Linux systems use a **home directory** but they are not always suitable for computation, which will take place beneath your *project root (see below).* When you log on to a system, it is typically configured for you to start in your home directory.

*Example:* if your user name is **mcmuffin**, your home directory will be `/home/mcmuffin`

On Github Codespaces, your user name is **codespace**, so your home directory will be `/home/codespace`.


### Your project root

For these lessons, the **project root** is the location on your server where you have downloaded (or *cloned*) the files for these workshops.

#### On Github Codespaces

If you're viewing this in a GitHub Codespace, then you have downloaded (or *cloned*) the repository automatically into the file path `/workspaces/trainings`.  Although VS Code starts at that location, your terminal will start in your home directory.

Github Codespace project root: `/workspaces/trainings`

#### On an HPC server

On an institutional high performance computing Linux server, there is often a designated space for code and computation.  Example: On my server at Alpine, I decided to put my project root in `/projects/dcking@colostate.edu/trainings`. I have to `cd` to the parent directory and clone the repository.

HPC Server Project root: `/your-project-space` **See your system administrator for more details**

---

### How many parallel threads do I have?

Note: nomenclature here can be "cores", "virtual CPUs", "threads", or some variation.  We will use **threads** to refer to the value you will pass to bioinformatics programs.

If you are on a Linux system, including Codespaces, do:

```
nproc
```

#### Examples

##### Codespaces (Linux in general)

```
$ nproc
2
```

##### AWS Cloud (configured for 4 virtual CPUs)

```
$ nproc
4
```

##### In a compute job on HPC

The number of threads is set **per job** when you submit to the scheduler. Use whatever number you requested in your job submission. If you are unsure, use **2** — it is always safe and will not affect your results, only speed.


##### Mac (not intended for these lessons)

```
% sysctl -n hw.logicalcpu

10
```
