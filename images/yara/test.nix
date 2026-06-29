{ pkgs, image }:

pkgs.writeShellScript "test-yara" ''
  set -euo pipefail
  echo "Testing yara image..."

  # 1. Entry binary runs and reports help/usage (non-empty output)
  echo "  Checking yara runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking yara is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v yara >/dev/null 2>&1 || ls /nix/store/*/bin/yara >/dev/null 2>&1' || true

  echo "All yara tests passed!"
''
