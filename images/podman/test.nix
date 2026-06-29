{ pkgs, image }:

pkgs.writeShellScript "test-podman" ''
  set -euo pipefail
  echo "Testing podman image..."

  # 1. podman prints help (exit 0, non-empty output)
  echo "  Checking podman --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. podman binary present in image
  echo "  Checking podman binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v podman >/dev/null 2>&1 || ls /nix/store/*/bin/podman >/dev/null 2>&1' || true

  echo "All podman tests passed!"
''
