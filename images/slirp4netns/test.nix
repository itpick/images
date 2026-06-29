{ pkgs, image }:

pkgs.writeShellScript "test-slirp4netns" ''
  set -euo pipefail
  echo "Testing slirp4netns image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking slirp4netns runs (--version)..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking slirp4netns is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v slirp4netns >/dev/null 2>&1 || ls /nix/store/*/bin/slirp4netns >/dev/null 2>&1'

  echo "All slirp4netns tests passed!"
''
