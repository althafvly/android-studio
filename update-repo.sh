#!/bin/bash
set -e

# Repository directory
REPO_DIR="repo"
mkdir -p "$REPO_DIR"

# Move all built packages to the repo directory
mv *.deb "$REPO_DIR/" || true

cd "$REPO_DIR"

# Generate Packages index
echo "Generating Packages index..."
dpkg-scanpackages . /dev/null > Packages
gzip -k -f Packages

# Generate Release file
echo "Generating Release file..."
apt-ftparchive release . > Release

echo "Repository update complete!"
ls -R .
