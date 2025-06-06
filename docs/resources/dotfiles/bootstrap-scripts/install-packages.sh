#!/bin/bash
set -e

PACKAGE_FILE="packages.txt"

if [ ! -f "$PACKAGE_FILE" ]; then
    echo "Package list not found!"
    exit 1
fi

echo "Updating package lists..."
sudo apt update

echo "Installing packages from $PACKAGE_FILE..."
xargs -a "$PACKAGE_FILE" sudo apt install -y
