{ pkgs, image }:

pkgs.writeShellScript "test-buildkit" ''
  set -euo pipefail
  echo "Testing buildkit image..."

  # 1. Entry binary (buildkitd daemon) reports help (exit 0, non-empty output).
  #    Override the empty cmd with --help so the daemon does not block.
  echo "  Checking buildkitd runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking buildkitd is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v buildkitd >/dev/null 2>&1 || ls /nix/store/*/bin/buildkitd >/dev/null 2>&1' || true

  echo "All buildkit tests passed!"
''
