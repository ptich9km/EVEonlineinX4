#!/bin/bash
# Build script for EVE Online in X4
# Creates a test-ready .zip archive in the parent directory.

set -e

ROOT="$(cd "$(dirname "$0")" && pwd)"
MOD_NAME="ptich_EVEonlineinX4"

# Read current version, increment by 1, and update content.xml
OLD_VERSION=$(sed -n 's/.*version="\([0-9]*\)".*/\1/p' "$ROOT/content.xml")
if [ -z "$OLD_VERSION" ]; then
    echo "ERROR: Could not read version from content.xml" >&2
    exit 1
fi
VERSION=$((OLD_VERSION + 1))
TODAY=$(date +%Y-%m-%d)

sed -i "s/version=\"$OLD_VERSION\"/version=\"$VERSION\"/g; s/date=\"[^\"]*\"/date=\"$TODAY\"/g" "$ROOT/content.xml"
echo "Bumped version $OLD_VERSION -> $VERSION, date -> $TODAY"

STAGING_DIR="$ROOT/../build_${MOD_NAME}"
OUT_ZIP="$ROOT/../${MOD_NAME}_v${VERSION}.zip"

echo "Building $MOD_NAME v$VERSION..."

# Clean previous staging and archive
rm -rf "$STAGING_DIR"
rm -f "$OUT_ZIP"

# Create directory structure
mkdir -p "$STAGING_DIR/$MOD_NAME"/assets/textures/ui/factions
mkdir -p "$STAGING_DIR/$MOD_NAME"/libraries
mkdir -p "$STAGING_DIR/$MOD_NAME"/md
mkdir -p "$STAGING_DIR/$MOD_NAME"/t

# Copy game files
cp "$ROOT/content.xml" "$STAGING_DIR/$MOD_NAME/"
cp "$ROOT/logo.jpg" "$STAGING_DIR/$MOD_NAME/"
cp "$ROOT/assets/textures/ui/factions/"*.tga "$STAGING_DIR/$MOD_NAME/assets/textures/ui/factions/"
cp "$ROOT/libraries/"*.xml "$STAGING_DIR/$MOD_NAME/libraries/"
cp "$ROOT/md/"*.xml "$STAGING_DIR/$MOD_NAME/md/"
cp "$ROOT/t/"*.xml "$STAGING_DIR/$MOD_NAME/t/"

# Create zip archive via PowerShell (available on Windows)
# Convert Unix paths to Windows paths for PowerShell
STAGING_DIR_WIN=$(cygpath -w "$STAGING_DIR\\$MOD_NAME")
OUT_ZIP_WIN=$(cygpath -w "$OUT_ZIP")
echo "Creating archive: $OUT_ZIP"
powershell -Command "Compress-Archive -Path '$STAGING_DIR_WIN' -DestinationPath '$OUT_ZIP_WIN' -Force"

# Clean up staging directory
rm -rf "$STAGING_DIR"

echo "Done. Archive: $OUT_ZIP"
