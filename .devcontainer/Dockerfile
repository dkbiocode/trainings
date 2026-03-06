# Optimized Dockerfile for Metagenomics Analysis Codespace
# Pre-installs bioinformatics tools for instant startup
# No R/RStudio - command-line only workflow

FROM python:3.9-bullseye

# =============================================================================
# Root section: install micromamba binary, create user, set up directories
# =============================================================================
# Note: Python devcontainer base image already has wget, curl, git, etc.

ENV MAMBA_ROOT_PREFIX=/opt/conda

# Download and install micromamba binary (requires root for /usr/local/bin)
# DON'T remove bin directory - it causes mkdir to fail somehow
RUN curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba && \
    cp bin/micromamba /usr/local/bin/micromamba

# Create non-root user and set ownership of conda and workspace directories
RUN useradd -m -s /bin/bash codespace && \
    mkdir -p /opt/conda && \
    chown -R codespace:codespace /opt/conda && \
    mkdir -p /home/codespace/dc_workshop/data/untrimmed_fastq && \
    mkdir -p /home/codespace/dc_workshop/data/trimmed_fastq && \
    mkdir -p /home/codespace/dc_workshop/results/fastqc_untrimmed_reads && \
    mkdir -p /home/codespace/dc_workshop/results/fastqc_trimmed_reads && \
    mkdir -p /home/codespace/dc_workshop/results/assembly_JC1A && \
    mkdir -p /home/codespace/dc_workshop/taxonomy && \
    mkdir -p /home/codespace/dc_workshop/mags && \
    mkdir -p /home/codespace/dc_workshop/docs

# =============================================================================
# User section: install conda environment as codespace (allows future installs)
# =============================================================================

USER codespace

# Make environment available
ENV MAMBA_ROOT_PREFIX=/opt/conda
ENV PATH="/opt/conda/envs/metagenomics/bin:$PATH"

# Create environment with essential tools
RUN /usr/local/bin/micromamba create -n metagenomics -y -c bioconda -c conda-forge \
    python=3.9 \
    fastqc=0.12.1 \
    trimmomatic=0.39 \
    spades=3.15.5 \
    kraken-biom=1.2.0 \
    && /usr/local/bin/micromamba clean -afy

# Auto-activate environment in bash
RUN echo 'eval "$(micromamba shell hook --shell bash)"' >> ~/.bashrc && \
    echo 'micromamba activate metagenomics' >> ~/.bashrc

# Download Trimmomatic adapters (continue even if it fails)
RUN wget -P /home/codespace/dc_workshop/data/untrimmed_fastq \
    https://raw.githubusercontent.com/timflutre/trimmomatic/master/adapters/TruSeq3-PE-2.fa || \
    echo "Note: Trimmomatic adapters download failed, students can download manually"

# =============================================================================
# Image Metadata
# =============================================================================

LABEL org.opencontainers.image.description="Metagenomics Analysis (command-line tools, no R/RStudio)"
LABEL org.opencontainers.image.source="https://github.com/meekrob/workshops-unified"
LABEL org.opencontainers.image.tools="fastqc, trimmomatic, spades, kraken-biom"

WORKDIR /home/codespace
