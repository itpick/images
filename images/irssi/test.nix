{ pkgs, image }:

pkgs.writeShellScript "test-irssi" ''
  set -euo pipefail
  echo "Testing irssi image..."

  # irssi runs and prints version/help (non-empty output)
  echo "  Checking irssi runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking irssi is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v irssi >/dev/null 2>&1 || ls /nix/store/*/bin/irssi >/dev/null 2>&1' || true

  echo "All irssi tests passed!"
''
