#!/bin/bash
# Enterprise SDD Archive Script
# Archives completed specs older than 90 days to cold storage

set -e

ARCHIVE_DIR="${SPEC_ARCHIVE_DIR:-$HOME/.spec-archive}"
CUTOFF_DAYS="${SPEC_ARCHIVE_DAYS:-90}"
CUTOFF_DATE=$(date -d "$CUTOFF_DAYS days ago" +%Y-%m-%d)

echo "🗄️  SDD Archive Process"
echo "   Archive dir: $ARCHIVE_DIR"
echo "   Cutoff: $CUTOFF_DAYS days ($CUTOFF_DATE)"
echo ""

# Create archive directory if not exists
mkdir -p "$ARCHIVE_DIR"

# Find all completed month directories
ARCHIVED_COUNT=0

find .specs -type d -path "*/completed/????-??" 2>/dev/null | while read month_dir; do
  month=$(basename "$month_dir")
  service=$(echo "$month_dir" | sed 's|.specs/\([^/]*\)/.*|\1|')

  # Check if month is older than cutoff
  if [[ "$month" < "${CUTOFF_DATE:0:7}" ]]; then
    archive_name="${service}_${month}.zip"
    archive_path="$ARCHIVE_DIR/$archive_name"

    echo "📦 Archiving: $month_dir"

    # Create archive
    if zip -rq "$archive_path" "$month_dir"; then
      # Create manifest entry
      echo "$(date -Iseconds)|$service|$month|$archive_name|$(du -h "$archive_path" | cut -f1)" >> "$ARCHIVE_DIR/manifest.log"

      # Remove from filesystem
      rm -rf "$month_dir"

      echo "   ✅ Archived to: $archive_path"
      ((ARCHIVED_COUNT++)) || true
    else
      echo "   ❌ Failed to archive"
    fi
  fi
done

echo ""
echo "🎉 Archive complete. Processed: $ARCHIVED_COUNT month(s)"

# Show archive stats
if [[ -f "$ARCHIVE_DIR/manifest.log" ]]; then
  echo ""
  echo "📊 Archive Statistics:"
  echo "   Total archives: $(wc -l < "$ARCHIVE_DIR/manifest.log")"
  echo "   Total size: $(du -sh "$ARCHIVE_DIR" | cut -f1)"
fi
