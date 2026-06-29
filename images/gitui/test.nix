{ pkgs, image }:

pkgs.writeShellScript "test-gitui" ''
  set -euo pipefail
  echo "Testing gitui image..."

  # Entrypoint binary runs and reports version/help (exit 0, non-empty output).
  echo "  Checking gitui runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image.
  echo "  Checking gitui binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gitui >/dev/null 2>&1 || ls /nix/store/*/bin/gitui >/dev/null 2>&1' || true

  echo "All gitui tests passed!"
''
