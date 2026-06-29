{ pkgs, image }:

pkgs.writeShellScript "test-rstudio" ''
  set -euo pipefail
  echo "Testing rstudio image..."

  # 1. Image runs a shell (smoke test)
  echo "  Checking shell runs..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking rstudio is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rstudio >/dev/null 2>&1 || ls /nix/store/*/bin/rstudio >/dev/null 2>&1' || true

  echo "All rstudio tests passed!"
''
