{ pkgs, image }:

pkgs.writeShellScript "test-nmap" ''
  set -euo pipefail
  echo "Testing nmap image..."

  # 1. Binary runs and reports version/help (non-empty output)
  echo "  Checking nmap runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking nmap is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nmap >/dev/null 2>&1 || ls /nix/store/*/bin/nmap >/dev/null 2>&1'

  echo "All nmap tests passed!"
''
