# System Setup Guide and Workbook

This document is intended for you to record important details of your setup so that you can refer to them later.  

This guide and workbook will keep you oriented during the lessons while giving you some experience using VS Code and markdown.

[Go directly to workbook section](#workbook-for-your-local-setup).


## VS Code and Markdown 

### VS Code

**V**isual **S**tudio **C**ode is an IDE - **I**ntegrated **D**evelopment **E**nvironment. It combines visual tools with an editor and a terminal into different panes of the same window. This makes it ideal for reviewing content and instructional material while being able to work in the terminal pane on the same screen.

#### Availability

VS Code is maintained by Microsoft as an [Open Source Product](https://github.com/Microsoft/vscode?tab=readme-ov-file#visual-studio-code---open-source-code---oss).  That means it is free to download to your desktop or laptop computer. More importantly for our purposes, various platforms use a version of it (VS Code Server) to allow access to files and execute commands remotely through your web browser. 

#### Further information

See this official [getting started](https://code.visualstudio.com/docs/getstarted/getting-started) guide, and/or [view this document](guides/VS-CODE-README.md) to see some examples in the GitHub Codespace setting.

### Markdown and how to use it

Markdown (as opposed to Mark***up***) is a syntax-light method of formatting plaintext documents.  It is human readable and intuitive to look at markup code but provides more flexible features when rendered, such as text formatting, links and images.

#### Example

![screen shots of Markdown code versus rendered formatted text](guides/img/md-syntax-vs-rendered.png)

If you're viewing this in VS Code, you can do <kbd>Shift</kbd>-<kbd>Command/ctrl</kbd>-<kbd>V</kbd> to render it (called Preview). If you're viewing this in GitHub, you are seeing the rendered version unless you click on raw or switch to "Code" in the content viewer pane.

#### Editing

This guide will have you edit and save command output.  In VS Code, try it now by double-clicking anywhere on this line of text which will open the editor and place the cursor on this line. Enter text in the space here: `___  ___` (e.g. your name). Now go back to the Preview window to see it rendered.

The lessons will not require editing, but this setup workbook below will assume you know how. Alternatively, you can make your own notes elsewhere.

## Workbook for your local setup

[back to top](#system-setup-guide-and-workbook)

Let's get started exploring our environment and noting important setup aspects for your computer. The lessons will link here for reference.

### Your project root

If you're viewing this in a GitHub Codespace, then you have downloaded (or *cloned*) the repository automatically.  If you are on a different Linux server, you will have cloned the repository into a specific place.

```
pwd
```

*MY PROJECT ROOT IS __*

---

### Your home directory

Most Linux systems use a **home directory**, but they are not always meant for computation. Also, GitHub Codespaces has one, but work is done elsewhere (/workspaces/).  


---

### How many parallel threads do I have?

Note: nomenclature here can be "cores", "virtual CPUs", "threads", or some variation.  We will use **threads** to refer to the value you will pass to bioinformatics programs.

If you are on a Linux system, including Codespaces, do:

```
nproc
```
*I AM USING __ THREADS*


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
