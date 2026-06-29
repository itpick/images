{ pkgs, image }:

pkgs.writeShellScript "test-grafana-operator" ''
  set -euo pipefail
  echo "Testing grafana-operator image..."

  # Daemon/service: smoke test that a shell runs and the binary is present.
  echo "  Checking shell + manager presence..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v manager >/dev/null 2>&1 || ls /nix/store/*/bin/manager >/dev/null 2>&1)'

  echo "All grafana-operator tests passed!"
''
