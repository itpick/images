{ pkgs, image }:

pkgs.writeShellScript "test-harbor-trivy-adapter" ''
  set -euo pipefail
  echo "Testing harbor-trivy-adapter image..."

  # Daemon/service: smoke test that a shell runs and the binary is present.
  echo "  Checking shell + scanner-trivy presence..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v scanner-trivy >/dev/null 2>&1 || ls /nix/store/*/bin/scanner-trivy >/dev/null 2>&1)'

  echo "All harbor-trivy-adapter tests passed!"
''
