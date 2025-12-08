# trivy-adapter
# =============
# Placeholder test for trivy-adapter container image.
# This image is not yet implemented.

{ pkgs, ... }:

pkgs.writeShellScript "test-trivy-adapter" ''
  set -euo pipefail
  
  echo "Testing trivy-adapter image..."
  echo "  SKIPPED: Image not yet implemented"
  echo ""
  echo "trivy-adapter test skipped (placeholder)"
''
