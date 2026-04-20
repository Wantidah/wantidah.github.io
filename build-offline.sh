#!/usr/bin/env bash
# build-offline.sh
# Render the Quarto site and bundle it into a single zip your friend can
# unzip and open in any browser — no server, no internet required.
#
# Usage:
#   ./build-offline.sh
#
# Output:
#   wantidah-website-offline.zip  (in the project root)
#
# On macOS: `chmod +x build-offline.sh` once, then `./build-offline.sh`.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

OUT_DIR="_site"
ZIP_NAME="wantidah-website-offline.zip"

echo "→ Rendering site with Quarto..."
quarto render

if [[ ! -d "$OUT_DIR" ]]; then
  echo "✗ _site/ was not produced. Check the render output above." >&2
  exit 1
fi

# Drop a tiny README at the root of the zip so the recipient knows what to open
cat > "$OUT_DIR/OPEN-ME.txt" <<EOF
Wantida's website — offline copy
--------------------------------
To view: double-click index.html (or open it in any browser).

Everything is local — no server or internet required. A handful
of web fonts fall back to system fonts when offline, which is
expected and harmless.
EOF

echo "→ Zipping $OUT_DIR → $ZIP_NAME..."
rm -f "$ZIP_NAME"
# -r recursive, -q quiet, -X strip macOS metadata
zip -r -q -X "$ZIP_NAME" "$OUT_DIR"

echo "✓ Done. Send $ZIP_NAME to your friend."
echo "  Size: $(du -h "$ZIP_NAME" | cut -f1)"
