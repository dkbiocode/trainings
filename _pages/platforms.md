---
layout: single
permalink: /platforms/
title: "Computing Platforms"
author_profile: false
toc: true
toc_sticky: true
header:
  overlay_color: "#11999e"
---

## Choose Your Computing Environment

These workshops can run on multiple platforms. Choose the one that best fits your needs, budget, and technical comfort level.

## Platform Comparison

| Platform | Cost | Setup Time | Performance | Best For |
|----------|------|------------|-------------|----------|
| **GitHub Codespaces** | Free tier (120 hrs/month) | < 1 minute | 2-4 cores, good | Beginners, quick start |
| **AWS EC2** | ~$5/month (stopped) | ~30 minutes | 8+ cores, excellent | Serious learners, large datasets |
| **Institutional HPC** | Free for students/staff | Varies | High | Students with HPC access |
| **Local Installation** | Free | 1-2 hours | Depends on hardware | Advanced users, offline work |

---

## GitHub Codespaces (Recommended)

**Perfect for getting started quickly**

### Pros
- ✅ No installation required
- ✅ Works in your browser
- ✅ Pre-configured environment
- ✅ Free tier available (120 core-hours/month)
- ✅ Easy to start, stop, and resume
- ✅ Same environment for all users

### Cons
- ❌ Limited free tier (60 hours on 2-core machine)
- ❌ Requires internet connection
- ❌ Less powerful than dedicated servers
- ❌ Costs money beyond free tier

### Quick Start

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/dkbiocode/trainings?quickstart=1){: .btn .btn--success .btn--large}

### Important Tips

⚠️ **Stop your Codespace when not using it**
- Go to [github.com/codespaces](https://github.com/codespaces)
- Click "Stop codespace" when taking breaks
- Set auto-timeout: Settings → Codespaces → 30 minutes

💡 **Monitor your usage**
- Check hours remaining: [github.com/settings/billing](https://github.com/settings/billing)
- Free tier: 120 core-hours/month
- 2-core machine = 60 hours actual usage
- 4-core machine = 30 hours actual usage

### Cost Beyond Free Tier

If you exceed 120 core-hours:
- **2-core machine**: ~$0.18/hour
- **4-core machine**: ~$0.36/hour
- **Example**: 10 extra hours on 2-core = ~$1.80

[**Detailed Codespaces Guide →**](../README.html#a-note-about-github-codespaces-free-tier-usage-and-limitations)

---

## AWS EC2 Cloud

**Best for dedicated learning and larger datasets**

### Pros
- ✅ More powerful than Codespaces (8 vCPU, 32 GB RAM)
- ✅ Pay only when running (~$0.30/hour)
- ✅ Very cheap when stopped (~$0.15/day for storage)
- ✅ Can handle large datasets
- ✅ Learn cloud computing skills
- ✅ Can create shareable templates (AMIs)

### Cons
- ❌ Requires AWS account and credit card
- ❌ More complex setup (~30 minutes)
- ❌ Must remember to stop instance
- ❌ Can be expensive if left running

### Monthly Cost Estimates

**Recommended usage** (stopped between sessions):
- Running: 20 hours/month × $0.30 = $6.00
- Stopped: 25 days × $0.15 = $3.75
- **Monthly total**: ~$10

**Left running 24/7** (not recommended):
- 720 hours × $0.30 = $216/month ⚠️

### Setup Guides

[**Complete AWS EC2 Setup Guide →**](../guides/aws-ec2-setup.html)

Step-by-step instructions for:
1. Creating an AWS account
2. Launching an EC2 instance
3. Installing workshop tools
4. Connecting with VS Code
5. Managing costs

[**VS Code Remote Connection Guide →**](../guides/aws-remote-connection.html)

Connect your local VS Code to your AWS instance for the best development experience.

### Recommended Instance

- **Type**: t3a.2xlarge (AMD x86_64)
- **vCPUs**: 8
- **RAM**: 32 GB
- **Storage**: 50 GB
- **Cost**: ~$0.30/hour running

---

## Institutional HPC

**Best for students and researchers with HPC access**

### Pros
- ✅ Free for students/staff
- ✅ Very powerful (request many cores)
- ✅ Large storage available
- ✅ Institutional support
- ✅ Learn HPC skills for research

### Cons
- ❌ Setup varies by institution
- ❌ May have job queues/wait times
- ❌ Less control over environment
- ❌ May need to request software installations

### Getting Started

1. **Check if you have HPC access**
   - Ask your institution's IT or research computing group
   - Common HPC systems: SLURM, PBS, SGE

2. **Request account if needed**
   - Usually requires faculty sponsor
   - May take a few days to process

3. **Adapt workshop instructions**
   - Use your HPC's job submission system
   - Request appropriate resources (4+ cores, 16+ GB RAM)
   - Follow our [HPC adaptation guide](#hpc-specific-tips)

### HPC-Specific Tips

**Resource requests:**
```bash
# Example SLURM job
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=4:00:00
```

**Module systems:**
Many HPCs use modules for software:
```bash
module avail    # See available software
module load bio # Load bioinformatics tools
```

**Data storage:**
- Use scratch space for analysis
- Move results to permanent storage
- Follow your HPC's data policies

---

## Local Installation

**For advanced users who want complete control**

### Pros
- ✅ No ongoing costs
- ✅ Works offline
- ✅ Complete control over environment
- ✅ Keep for future projects

### Cons
- ❌ Complex setup (1-2 hours)
- ❌ Depends on your hardware
- ❌ Troubleshooting on your own
- ❌ Platform-specific issues

### Supported Platforms

**macOS** (recommended: macOS 14 or later)
- [**Jekyll Setup Guide**](../guides/jekyll-local-setup-macos.html)
- Use Homebrew for package management
- Conda/Micromamba for bioinformatics tools

**Linux** (Ubuntu 22.04+ recommended)
- Easiest for bioinformatics
- Native package managers work well
- Most tools designed for Linux

**Windows**
- Use Windows Subsystem for Linux (WSL2)
- Ubuntu on WSL recommended
- Follow Linux instructions within WSL

### Minimum Requirements

- **CPU**: 4 cores
- **RAM**: 8 GB (16 GB recommended)
- **Storage**: 50 GB free space
- **OS**: macOS 14+, Ubuntu 22.04+, or Windows 10+ with WSL2

---

## Platform Selection Guide

### Choose GitHub Codespaces if:
- You want to start immediately
- You're new to command line
- You want the same environment as other learners
- You'll complete workshops within free tier limits

### Choose AWS EC2 if:
- You want more computing power
- You're comfortable with basic cloud concepts
- You plan to work on larger datasets
- You can afford ~$5-10/month
- You want to learn cloud computing

### Choose Institutional HPC if:
- You're a student or researcher with access
- You need very high performance
- You want to learn HPC for research
- You prefer free computing resources

### Choose Local Installation if:
- You want to work offline
- You have good hardware (8+ cores, 16+ GB RAM)
- You're comfortable troubleshooting
- You'll use these tools for other projects

---

## Getting Help

### Codespaces Issues
- Check [GitHub Codespaces documentation](https://docs.github.com/en/codespaces)
- Review our [README troubleshooting section](../README.html)

### AWS Issues
- See our [AWS troubleshooting guide](../guides/aws-ec2-setup.html#troubleshooting)
- Check [AWS documentation](https://docs.aws.amazon.com/)

### HPC Issues
- Contact your institution's research computing support
- Check your HPC's documentation

### General Questions
- [Report issues on GitHub](https://github.com/dkbiocode/trainings/issues)
- Check the [System Setup Guide](../system-setup-guide.html)

---

## Multi-Platform Workflows

You can mix platforms! For example:
- Start with Codespaces to learn basics
- Move to AWS for larger datasets
- Eventually deploy on HPC for research

All platforms use the same Linux commands and tools, so skills transfer directly.
