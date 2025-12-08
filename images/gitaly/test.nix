# gitaly
# =============
# Placeholder test for gitaly container image.
# This image is not yet implemented.

{ pkgs, ... }:

pkgs.writeShellScript "test-gitaly" ''
  set -euo pipefail
  
  echo "Testing gitaly image..."
  echo "  SKIPPED: Image not yet implemented"
  echo ""
  echo "gitaly test skipped (placeholder)"
''
