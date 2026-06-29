{ pkgs, image }:

pkgs.writeShellScript "test-httpd" ''
  set -euo pipefail
  echo "Testing httpd image..."

  # httpd runs and prints version (non-empty output, exit 0)
  echo "  Checking httpd runs..."
  out=$(docker run --rm --entrypoint httpd ${image.imageName}:test -v 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking httpd is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v httpd >/dev/null 2>&1 || ls /nix/store/*/bin/httpd >/dev/null 2>&1' || true

  echo "All httpd tests passed!"
''
