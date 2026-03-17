# System Setup Guide

This guide helps you understand your computing environment and provides reference information for different computing platforms.

## System Information Quick Reference

Use this table to find the correct values for your computing environment. Note, the values for GitHub Codespaces and AWS are the ones chosen for these trainings:

| Environment | Username | Home Directory | Project Root | Compute Threads | Note |
|------------|----------|----------------|--------------|-----------------| ----- |
| **GitHub Codespaces** | `codespace` | `/home/codespace` | `/workspaces/trainings` | 2 (use `nproc` to verify) | Can set to 4 in "change machine type" |
| **AWS EC2** | `ubuntu` | `/home/ubuntu` | `/home/ubuntu/trainings` | 8 for t3a.2xlarge (use `nproc` to verify) | Higher tiers available <a href="guides/img/instance-comparison-with-prices.png" target="_new">(see compute costs)</a>|
| **HPC Server** (varies) | Commonly your institution ID | `/home/YOUR_ID` | `/projects/YOUR_ID/trainings` (may vary) | Check job script or use 2 as default | Can allocate per job |


**Note for HPC users:** Consult your system administrator for your specific project space location and available resources.

---

## Understanding Your Environment

### Home Directory

When you log into a Linux system, you start in your **home directory**. This is your personal space, typically located at `/home/YOUR_USERNAME`.

**Key Points:**
- Your terminal starts here by default
- Configuration files are stored here (`.bashrc`, `.ssh/config`, etc.)
- Most computational work happens in your **project root**, not your home directory

**Find your home directory:**
```bash
echo $HOME
# Or
cd ~
pwd
```

---

### Project Root

The **project root** is where the workshop files are stored. This is your working directory for all lessons and exercises.

#### GitHub Codespaces

The repository is automatically cloned to: `/workspaces/trainings`

**Navigation:**
```bash
# From anywhere, navigate to project root:
cd /workspaces/trainings

# Check where you are:
pwd
```

#### AWS EC2 (Following This Guide's Setup)

After cloning, the repository is at: `/home/ubuntu/trainings`

**Navigation:**
```bash
# From anywhere, navigate to project root:
cd ~/trainings

# Check where you are:
pwd
```

#### HPC Server

On institutional high-performance computing (HPC) servers, you'll have a designated workspace for code and computation.

**Common patterns:**
- `/projects/YOUR_USERNAME/trainings`
- `/scratch/YOUR_USERNAME/trainings`
- `/work/YOUR_USERNAME/trainings`

**Setup:**
```bash
# Navigate to your project space (example):
cd /projects/YOUR_USERNAME

# Clone the repository:
git clone https://github.com/dkbiocode/trainings.git

# Navigate to project root:
cd trainings
```

⚠️ **Consult your system administrator** for your specific project space location.

---

## How Many Parallel Threads Do I Have?

**Threads** (also called "cores", "virtual CPUs", or "processors") determine how many tasks your system can run simultaneously. Many bioinformatics programs can use multiple threads to run faster.

#### Finding Your Thread Count

**On Linux systems (including Codespaces):**
```bash
$ nproc
```

**On Mac:**
```bash
$ sysctl -n hw.logicalcpu
```

#### Examples by Environment

##### GitHub Codespaces
```
$ nproc
2
```
Most Codespaces have 2 threads available.

##### AWS Cloud (Example: 4 virtual CPUs)
```
$ nproc
4
```

##### HPC Compute Job
The number of threads is specified **when you submit your job** to the scheduler.

**Important:**
- Use the thread count you requested in your job submission
- If unsure, use **2** - this is always safe and won't affect results, only speed
- Check your job script or ask your system administrator

**Example job script:**
```bash
#SBATCH --cpus-per-task=8    # This means 8 threads available
```

##### Mac (Not Recommended for These Lessons)
```
$ sysctl -n hw.logicalcpu
10
```
*Note: These workshops are designed for Linux environments. Mac users should use GitHub Codespaces.*

---

### Quick Reference Commands

**Check where you are:**
```bash
$ pwd                    # Print working directory
```

**Navigate to project root (Codespaces):**
```bash
$ cd /workspaces/trainings
```

**Navigate to home directory:**
```bash
$ cd ~                   # or just: cd
```

**List your environment:**
```bash
$ whoami                 # Show your username
$ pwd                    # Show current directory
$ nproc                  # Show available threads
```
