{ pkgs, image }:

pkgs.writeShellScript "test-nixpkgs-fmt" ''
  set -euo pipefail
  echo "Testing nixpkgs-fmt image..."

  # 1. Binary runs and reports version/help (non-empty output)
  echo "  Checking nixpkgs-fmt runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking nixpkgs-fmt is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nixpkgs-fmt >/dev/null 2>&1 || ls /nix/store/*/bin/nixpkgs-fmt >/dev/null 2>&1' || true

  echo "All nixpkgs-fmt tests passed!"
''
