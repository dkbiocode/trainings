Click here to start: [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/NAHLN/trainings?quickstart=1)

# Codespace Workshops for Linux and NGS Bioinformatics Workflows

These trainings and associated lessons are adapted from the popular [datacarpentry project](https://datacarpentry.org) to be easily executed in Github Codespaces.  However, 
they can also be used on a Cloud Server or your own institutional HPC with minimal changes.

These trainings are geared toward developing a working knowledge of bioinformatics tools, Linux and command literacy, and understanding of NGS analysis core concepts - especially those related to metagenomics and pathogen detection.

The content and presentation of the lessons strive for a balance between the lesson objectives and the technical steps needed to accomplish them. Therefore, some steps have been done for you to make learning smoother.  The technical steps are important to learn, however, and will be included in focused vignettes (Software installation, using and tracking progress with Git, and File/Folder orientation).

## A Note About GitHub Codespaces Free Tier Usage and Limitations

**GitHub Codespaces offers a free tier**, but it has monthly usage limits that you should be aware of:

### Free Tier Limits (as of 2026)

- **120 core-hours per month** for personal GitHub accounts
- **15 GB storage per month**
- 2-core machine = **60 hours** of actual usage per month
- 4-core machine = **30 hours** of actual usage per month

**Storage Impact:** With the workshop Docker image and data (~20 GB used in an active Codespace), you'll consume the 15 GB free storage allowance. This reduces your effective free days by ~33% (20/15 = 1.33x the base storage). Excess storage costs ~$0.07/GB/month, adding ~$0.35/month for this workshop.

### What This Means for Workshops

**These workshops can consume significant Codespace hours:**
- Shell workshops: ~2-4 hours
- Metagenomics analysis: ~8-12 hours (includes compute-intensive assembly)
- **Total series:** ~15-20 hours of active usage

### Important Warnings

⚠️ **Your Codespace continues running (and using hours) even when you're not actively using it** unless you stop it.

⚠️ **You can exceed the free tier** if you:
- Leave Codespaces running overnight or between sessions
- Run multiple workshops in the same month
- Use larger machines (4-core uses hours 2x faster)

### Best Practices to Avoid Overage Charges

1. **Stop your Codespace when done:** Don't just close the browser tab!
   - Go to https://github.com/codespaces
   - Click "Stop codespace" for your active session

2. **Set a timeout:** Configure Codespaces to auto-stop after 30 minutes of inactivity
   - Settings → Codespaces → Default idle timeout

3. **Monitor your usage:** Check remaining hours at https://github.com/settings/billing

4. **Delete Codespaces you're done with:** Old Codespaces consume storage quota

### Alternatives if You Hit the Limit

If you exceed the free tier or need more resources:

1. **Pay as you go (cheapest for occasional use):**
   - You don't need to upgrade to GitHub Pro
   - Just continue using Codespaces and pay for overage
   - Cost: ~$0.18/hour for 2-core machine
   - Example: 10 extra hours = ~$1.80
   - Add payment method at https://github.com/settings/billing

2. **AWS EC2:** See [AWS Setup Guide](guides/aws-ec2-setup.md) - costs ~$5/month if stopped between uses

3. **Institutional HPC:** Use your institution's computing resources (free for students/staff)

4. **Upgrade to GitHub Pro ($4/month):** Includes 180 core-hours/month (50% more than free tier)

### Recommended Approach

- **Start with Codespaces** for convenience (free tier is enough for most single workshops)
- **Switch to AWS/HPC** if running multiple workshops or hitting limits
- **Always stop Codespaces** when taking breaks

---

## Getting started

The various trainings are in the "workshops" directory and contain:


### Shell novice

[Start with shell novice](workshops/shell-novice/lessons/README.md) if you are just getting oriented to the command line or want more experience.

### Metagenomics

This is a collection of trainings that cover different aspects of a bioinformatics project:

* [metagenomics-organization](workshops/metagenomics/metagenomics-organization/lessons/01-tidiness.md) - best practices for data organization
* [metagenomics-shell](workshops/metagenomics/metagenomics-shell/lessons/01-introduction.md) - more experience with command line and shell
* [metagenomics-analysis](workshops/metagenomics/metagenomics-analysis/lessons/01-background-metadata.md) - Work with data in the metagenomics project and learn key software tools


## Compute environment

Github Codespaces, HPC Servers, and Bioinformatics Cloud Computing environments are all Linux systems. Each has its own file and directory (folder) organization designed to manage large computational and data storage requirements. Follow [this guide](system-setup-guide.md) to help orient yourself.

### [System setup guide](system-setup-guide.md)

Use [this guide](system-setup-guide.md) to orient yourself to your compute environment.