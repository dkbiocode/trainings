---
layout: single
permalink: /metagenomics/
title: "Metagenomics Lessons"
author_profile: false
toc: true
toc_sticky: true
header:
  overlay_color: "#1D4387"

---

## Comprehensive Metagenomics Training

A complete series covering the full bioinformatics workflow from data organization through taxonomic classification. Work with real metagenomic data and learn industry-standard tools and best practices.

## Workshop Series

### 1. Data Organization

**Learn best practices for structuring bioinformatics projects**

Good organization saves time and prevents errors. Learn how to structure your data and projects for reproducibility.

[**Start Data Organization →**](../workshops/metagenomics/metagenomics-organization/lessons/01-tidiness.html){: .btn .btn--primary .btn--large}

**What you'll learn:**
- Organize files and directories for clarity
- Name files systematically
- Document your work
- Maintain data integrity
- Plan for reproducibility

**Duration:** 1-2 hours
**Prerequisites:** Basic command line knowledge
**Why it matters:** Proper organization prevents data loss and makes analysis reproducible

---

### 2. Shell for Metagenomics

**Apply command-line skills to bioinformatics workflows**

Master shell scripting in the context of sequence data analysis.

[**Start Shell Workshop →**](../workshops/metagenomics/metagenomics-shell/lessons/01-introduction.html){: .btn .btn--primary .btn--large}

**What you'll learn:**
- Work with FASTQ files
- Batch process multiple samples
- Write loops for automation
- Build analysis scripts
- Navigate bioinformatics file formats

**Duration:** 3-4 hours
**Prerequisites:** Shell novice or equivalent ([Start here](../shell-beginner/) if needed)
**Tools:** Command line, FastQC, sequence files

---

### 3. Metagenomics Analysis

**Complete hands-on workflow from raw reads to taxonomic profiles**

Learn the full metagenomics analysis pipeline using real pathogen surveillance data.

[**Start Analysis Workshop →**](../workshops/metagenomics/metagenomics-analysis/lessons/01-background-metadata.html){: .btn .btn--primary .btn--large}

**What you'll learn:**
- Quality control with FastQC
- Read trimming and filtering (Trimmomatic)
- *De novo* genome assembly (SPAdes)
- Taxonomic classification (Kraken)
- Interpret quality metrics
- Troubleshoot common issues

**Duration:** 8-12 hours (spread over multiple sessions)
**Prerequisites:** Shell for metagenomics or equivalent
**Tools:** FastQC, Trimmomatic, SPAdes, Kraken, BioConda

---

## Complete Learning Path

```
┌──────────────────────┐
│  Shell Novice        │  ← Start here if new to command line
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│  Data Organization   │  ← Learn best practices
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│  Metagenomics Shell  │  ← Apply shell to bioinformatics
└──────────┬───────────┘
           ↓
┌───────────────────────┐
│  Metagenomics         │  ← Full analysis workflow
│  Analysis             │
└───────────────────────┘
```

## What is Metagenomics?

Metagenomics is the study of genetic material recovered directly from environmental samples. Instead of culturing organisms individually, metagenomics analyzes all DNA present in a sample.

### Applications

**Public Health**
- Pathogen surveillance in food, water, animals
- Track disease outbreaks
- Monitor antimicrobial resistance

**Environmental Science**
- Study microbial communities in soil, water, air
- Track ecosystem changes
- Discover new microorganisms

**Microbiome Research**
- Human gut microbiome
- Agricultural microbiomes
- Industrial applications

## Tools You'll Master

### Quality Control
- **FastQC**: Assess sequencing quality
- **MultiQC**: Aggregate QC reports

### Read Processing
- **Trimmomatic**: Remove adapters and low-quality bases
- **Cutadapt**: Alternative trimming tool

### Assembly
- **SPAdes**: *De novo* genome assembly
- **MEGAHIT**: Memory-efficient assembler

### Taxonomy
- **Kraken2**: Fast taxonomic classification
- **Krona**: Interactive taxonomic visualization

### Package Management
- **Conda/Micromamba**: Install and manage bioinformatics tools

## Data You'll Analyze

Real metagenomic datasets from:
- Food safety surveillance
- Animal health monitoring
- Environmental samples

All data is public and can be used for your own projects after the workshop.

## System Requirements

### Recommended: GitHub Codespaces
- **Free tier**: 120 core-hours/month
- **2-core machine**: Sufficient for all workshops
- **No installation**: Works in browser
- [**Launch Codespace →**](https://codespaces.new/dkbiocode/trainings?quickstart=1)

### Alternative: AWS EC2
- **Cost**: ~$5/month if stopped between uses
- **Performance**: 8 vCPU, 32 GB RAM recommended
- **Setup time**: ~30 minutes
- [**AWS Setup Guide →**](../guides/aws-ec2-setup.html)

### Alternative: Institutional HPC
- **Cost**: Free for students/staff
- **Performance**: Variable (request 4+ cores)
- **Setup time**: Depends on institution
- [**HPC Guide →**](../platforms/#institutional-hpc)

## Time Commitment

**Minimum path** (shell experience):
- Data Organization: 1 hour
- Metagenomics Analysis: 8 hours
- **Total**: ~9 hours

**Complete path** (beginner):
- Shell Novice: 3 hours
- Data Organization: 1 hour
- Metagenomics Shell: 3 hours
- Metagenomics Analysis: 8 hours
- **Total**: ~15 hours

**Recommended schedule**:
- Spread over 2-3 days
- Take breaks between modules
- Practice concepts before moving forward

## Learning Outcomes

By completing this series, you will be able to:

✅ Organize bioinformatics projects for reproducibility

✅ Process raw sequencing data through quality control

✅ Perform *de novo* genome assembly from metagenomic reads

✅ Classify sequences taxonomically

✅ Interpret quality metrics and troubleshoot issues

✅ Adapt workflows for different compute environments

✅ Automate analyses with shell scripts

✅ Understand core metagenomics concepts and terminology

## Get Started

1. **Assess your skills**: New to command line? Start with [Shell for Beginners](../shell-beginner/)
2. **Launch environment**: See [Quick Start](../quick-start/) for Codespaces setup
3. **Begin learning**: Start with [Data Organization](../workshops/metagenomics/metagenomics-organization/lessons/01-tidiness.html)

## Additional Resources

- [System Setup Guide](../system-setup-guide.html) - Orient yourself to your compute environment
- [Platform Options](../platforms/) - AWS, HPC, or local installation guides
- [Troubleshooting](../guides/) - Common issues and solutions

## Questions?

- **Report issues**: [GitHub Issues](https://github.com/dkbiocode/trainings/issues)
- **Check guides**: See [Platform Guides](../platforms/) for setup help
