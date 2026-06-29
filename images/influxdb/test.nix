{ pkgs, image }:

pkgs.writeShellScript "test-influxdb" ''
  set -euo pipefail
  echo "Testing influxdb image..."

  # Daemon/service: smoke test that a shell runs and the binary is present.
  echo "  Checking shell + influxd presence..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v influxd >/dev/null 2>&1 || ls /nix/store/*/bin/influxd >/dev/null 2>&1)'

  echo "All influxdb tests passed!"
''
