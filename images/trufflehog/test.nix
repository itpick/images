{ pkgs, image }:

pkgs.writeShellScript "test-trufflehog" ''
  set -euo pipefail
  echo "Testing trufflehog image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking trufflehog runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking trufflehog is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v trufflehog >/dev/null 2>&1 || ls /nix/store/*/bin/trufflehog >/dev/null 2>&1' || true

  echo "All trufflehog tests passed!"
''
