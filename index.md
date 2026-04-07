---
layout: splash
permalink: /
hidden: true
header:
  overlay_color: "#1D4387"
title: "Bioinformatics Training Workshops"
tagline: "Interactive workshops for Linux, bioinformatics, and metagenomics"
classes: wide

feature_row1:
  - image_path: /assets/images/quick-start-icon.png
    alt: "Quick Start"
    title: "Quick Start"
    excerpt: "Launch a fully-configured bioinformatics environment in under 2 minutes. No installation required - start learning immediately with GitHub Codespaces."
    url: "/quick-start/"
    btn_class: "btn--inverse"
    btn_label: "Get Started"
  - image_path: /assets/images/shell-icon.png
    alt: "Shell for Beginners"
    title: "Shell for Beginners"
    excerpt: "Master the Linux command line with hands-on workshops. Perfect for complete beginners - learn to navigate, automate, and work efficiently."
    url: "/shell-beginner/"
    btn_class: "btn--inverse"
    btn_label: "Learn Shell"
  - image_path: /assets/images/shell-icon.png
    alt: "Metagenomics Lessons"
    title: "Metagenomics Lessons"
    excerpt: "Complete workflow from raw reads to taxonomic profiles. Quality control, assembly, and classification with industry-standard tools."
    url: "/metagenomics/"
    btn_class: "btn--inverse"
    btn_label: "Start Analysis"

feature_row2:
  - image_path: /assets/images/platforms-icon.png
    alt: "Computing Platforms"
    title: "Computing Platforms"
    excerpt: "Run on GitHub Codespaces, AWS EC2, institutional HPC, or locally. Choose the platform that fits your needs and budget."
    url: "/platforms/"
    btn_class: "btn--inverse"
    btn_label: "Choose Platform"
---

## Get Started Now

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/dkbiocode/trainings?quickstart=1){: .btn .btn--success .btn--large}

**Start learning in under 2 minutes!** Click above to launch a fully-configured environment.

---

{% include feature_row id="feature_row1" %}

{% include feature_row id="feature_row2" %}

---

## About These Workshops

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
