# Metagenomics Workshop Series

This series teaches the complete workflow for metagenomic analysis, from basic Unix shell skills to advanced taxonomic and functional analysis of microbial communities.  You will need external data for this part of the workshop, so go to [Workshop Data](#workshop-data-dc_workshop) for an overview or directory to the [download instructions](#downloading-the-data).

## Workshop Modules

The metagenomics workshop series consists of three modules that can be taken independently or in sequence:

### 1. [Introduction to the Shell for Metagenomics](metagenomics-shell/)
Learn essential Unix command-line skills for working with metagenomic data files.

**[View lessons →](metagenomics-shell/lessons/README.md)**

### 2. [Data Organization for Metagenomics Projects](metagenomics-organization/)
Best practices for organizing, documenting, and managing metagenomic sequencing projects.

**[View lessons →](metagenomics-organization/lessons/README.md)**

### 3. [Metagenomics Analysis](metagenomics-analysis/)
Complete shotgun metagenomics analysis pipeline: quality control, assembly, binning, and taxonomic assignment.

**[View lessons →](metagenomics-analysis/lessons/README.md)**

## Recommended Path

For complete beginners:
1. Start with [shell-novice](../shell-novice/) or [metagenomics-shell](metagenomics-shell/)
2. Continue with [metagenomics-organization](metagenomics-organization/)
3. Complete the series with [metagenomics-analysis](metagenomics-analysis/)

## Workshop Data: `dc_workshop/`

The metagenomics workshops use a curated dataset from the Cuatro Ciénegas basin, a unique desert ecosystem in Mexico. The dataset includes shotgun metagenomic sequencing data from microbial mat samples.

### What's in `dc_workshop/`?

The `dc_workshop/` directory contains:

- **`data/untrimmed_fastq/`** - Raw paired-end sequencing reads (FASTQ format)
  - Two samples: JC1A and JP4D
  - Adapter sequences for trimming (TruSeq3-PE.fa)
- **`mags/`** - Metagenome-assembled genomes (MAGs) in FASTA format
- **`taxonomy/`** - Taxonomic classification results (Kraken2 outputs)
- **`.hidden/`** - Hidden files for shell exercises

### Data Source

The data is archived on Zenodo: https://zenodo.org/records/7010950

Size: ~1.2 GB (compressed)

### Downloading the Data

The workshop data is **not included in this repository** due to its size. You must download it before starting the metagenomics-analysis workshop.

#### Option 1: Run the Download Script (Recommended)

**From the project root:**

```bash
bash workshops/metagenomics/download_data.sh
```

**From anywhere else (provide the full path):**

```bash
bash /path/to/trainings/workshops/metagenomics/download_data.sh
```

Or navigate to the script location first:

```bash
cd workshops/metagenomics
bash download_data.sh
```

This script will:
1. Download the data from Zenodo (~1.2 GB)
2. Extract it to `workshops/metagenomics/dc_workshop/` (regardless of where you run it from)
3. Clean up temporary files
4. Skip the download if `dc_workshop/` already exists

#### Option 2: Manual Download

1. Download the zip file from Zenodo:
   ```bash
   cd workshops/metagenomics
   wget 'https://zenodo.org/records/7010950/files/dc_workshop.zip?download=1' -O dc_workshop.zip
   ```

2. Extract it:
   ```bash
   unzip dc_workshop.zip
   ```

3. Clean up:
   ```bash
   rm dc_workshop.zip
   rm -rf dc_workshop/.backup_dc_workshop
   ```

### Verifying the Download

After downloading, check that `dc_workshop/` contains the expected directories:

```bash
ls workshops/metagenomics/dc_workshop/
```

You should see:
```
data/  mags/  taxonomy/  
```

### When to Download

- **metagenomics-shell:** Uses a hidden directory for exercises - download before starting
- **metagenomics-analysis:** Uses all directories - download before Lesson 2

## Storage Notes

- The `dc_workshop/` directory is **gitignored** (too large for git)
- Each user must download it independently

## Questions or Issues?

If you encounter problems downloading the data:
1. Check your internet connection
2. Ensure you have ~2 GB of free disk space (`df -h .`)
3. Verify `wget` or `curl` is installed
4. Contact your workshop instructor
