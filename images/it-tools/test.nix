{ pkgs, image }:

pkgs.writeShellScript "test-it-tools" ''
  set -euo pipefail
  echo "Testing it-tools image..."

  # Daemon/service: smoke test that a shell runs and the binary is present.
  echo "  Checking shell + it-tools presence..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v it-tools >/dev/null 2>&1 || ls /nix/store/*/bin/it-tools >/dev/null 2>&1)'

  echo "All it-tools tests passed!"
''
