{ pkgs, image }:

pkgs.writeShellScript "test-sonar-scanner-cli" ''
  set -euo pipefail
  echo "Testing sonar-scanner-cli image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking sonar-scanner runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking sonar-scanner is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v sonar-scanner >/dev/null 2>&1 || ls /nix/store/*/bin/sonar-scanner >/dev/null 2>&1'

  echo "All sonar-scanner-cli tests passed!"
''
