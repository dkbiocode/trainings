---
layout: splash
title: "Bioinformatics Training Workshops"
header:
  overlay_color: "#000"
  overlay_filter: "0.5"
  overlay_image: /assets/images/dna-banner.jpg
excerpt: "Interactive workshops for learning Linux command line, bioinformatics tools, and metagenomics analysis"
---

## Get Started Now

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/dkbiocode/trainings?quickstart=1){: .btn .btn--success .btn--large}

**Start learning in under 2 minutes!** Click the button above to launch a fully-configured bioinformatics environment with all tools pre-installed.

---

## About These Workshops

These training materials are adapted from the [Data Carpentry](https://datacarpentry.org) project and designed for hands-on learning in:

- **Linux command line** and shell scripting
- **Bioinformatics workflows** for NGS data analysis
- **Metagenomics analysis** and pathogen detection
- **Best practices** for data organization and reproducibility

**Multiple compute options available:**
- **GitHub Codespaces** (recommended for beginners - free tier available)
- **AWS EC2** cloud servers
- **Institutional HPC** systems

---

## Workshop Series

### 🐚 Shell Novice
**Start here if you're new to the command line**

Learn essential Linux commands, file navigation, and basic scripting.

[**Start Shell Workshop →**](workshops/shell-novice/lessons/README.html){: .btn .btn--primary}

**Duration:** 2-4 hours
**Prerequisites:** None

---

### 🧬 Metagenomics Series

A comprehensive series covering the full bioinformatics workflow:

#### 1. Data Organization
Learn best practices for structuring bioinformatics projects.

[**Start Data Organization →**](workshops/metagenomics/metagenomics-organization/lessons/01-tidiness.html){: .btn .btn--primary}

**Duration:** 1-2 hours
**Prerequisites:** Basic command line knowledge

#### 2. Shell for Metagenomics
Apply shell skills to real bioinformatics workflows.

[**Start Shell Workshop →**](workshops/metagenomics/metagenomics-shell/lessons/01-introduction.html){: .btn .btn--primary}

**Duration:** 3-4 hours
**Prerequisites:** Shell novice or equivalent

#### 3. Metagenomics Analysis
Hands-on analysis with quality control, assembly, and taxonomic classification.

[**Start Analysis Workshop →**](workshops/metagenomics/metagenomics-analysis/lessons/01-background-metadata.html){: .btn .btn--primary}

**Duration:** 8-12 hours
**Prerequisites:** Shell for metagenomics or equivalent

**Tools covered:** FastQC, Trimmomatic, SPAdes, Kraken

---

## Setup Guides

### System Setup Guide
Orient yourself to your compute environment (Codespaces, AWS, or HPC).

[**View Setup Guide →**](system-setup-guide.html){: .btn .btn--info}

### AWS EC2 Setup
Detailed instructions for setting up your own AWS cloud server.

[**AWS Setup Guide →**](guides/aws-ec2-setup.html){: .btn .btn--info}

### AWS Remote Connection
Connect VS Code to your AWS instance for remote development.

[**Connection Guide →**](guides/aws-remote-connection.html){: .btn .btn--info}

---

## About GitHub Codespaces

**GitHub Codespaces offers a free tier** with 120 core-hours per month (enough for 1-2 workshops).

### Important Notes:

⚠️ **Stop your Codespace when not using it** - it continues running (and using hours) even when you close the browser!

- Go to [github.com/codespaces](https://github.com/codespaces) and click "Stop codespace"
- Set an auto-timeout (Settings → Codespaces → 30 minutes recommended)
- Monitor usage at [github.com/settings/billing](https://github.com/settings/billing)

### Alternative Options:

If you exceed the free tier or need more resources:
- **Pay-as-you-go:** Continue using Codespaces at ~$0.18/hour for a 2-core machine
- **AWS EC2:** ~$5/month if stopped between uses (see [AWS guide](guides/aws-ec2-setup.html))
- **Institutional HPC:** Use your institution's computing resources

---

## Learning Objectives

By completing these workshops, you will be able to:

- Navigate Linux systems confidently using the command line
- Organize bioinformatics projects following best practices
- Execute quality control on NGS sequencing data
- Perform *de novo* genome assembly
- Classify microbial sequences taxonomically
- Understand core concepts in metagenomics and pathogen detection
- Adapt workflows for different compute environments

---

## Questions or Issues?

- **Repository:** [github.com/dkbiocode/trainings](https://github.com/dkbiocode/trainings)
- **Report Issues:** [GitHub Issues](https://github.com/dkbiocode/trainings/issues)

---

## Credits

These materials are adapted from [Data Carpentry](https://datacarpentry.org) lessons and modified for use with GitHub Codespaces and cloud computing environments.
