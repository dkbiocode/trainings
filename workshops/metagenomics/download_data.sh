#!/bin/bash
# Download and set up metagenomics workshop data
# Source: https://zenodo.org/records/7010950
#
# Run this script from any directory — it will place dc_workshop/
# in workshops/metagenomics/ relative to the repo root.
#
# Usage: bash workshops/metagenomics/download_data.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

if [ -d dc_workshop ]; then
    echo "dc_workshop/ already exists, skipping download."
    exit 0
fi

DOWNLOADED_ZIP=false
if [ ! -f dc_workshop.zip ]; then
    echo "Downloading workshop data (~1.2GB)..."
    wget 'https://zenodo.org/records/7010950/files/dc_workshop.zip?download=1' -O dc_workshop.zip
    DOWNLOADED_ZIP=true
else
    echo "dc_workshop.zip already present, skipping download."
fi

echo "Unzipping..."
unzip -q dc_workshop.zip

# Remove backup directory (pre-computed results, not needed for the workshop)
rm -rf dc_workshop/.backup_dc_workshop

if [ "$DOWNLOADED_ZIP" = true ]; then
    echo "Cleaning up..."
    rm dc_workshop.zip
fi

echo "Done. dc_workshop/ is ready at workshops/metagenomics/dc_workshop/"
echo ""
echo "Contents:"
ls dc_workshop/
