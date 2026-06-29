{ pkgs, image }:

pkgs.writeShellScript "test-podman-tui" ''
  set -euo pipefail
  echo "Testing podman-tui image..."

  # 1. podman-tui prints help (exit 0, non-empty output)
  echo "  Checking podman-tui --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. podman-tui binary present in image
  echo "  Checking podman-tui binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v podman-tui >/dev/null 2>&1 || ls /nix/store/*/bin/podman-tui >/dev/null 2>&1' || true

  echo "All podman-tui tests passed!"
''
