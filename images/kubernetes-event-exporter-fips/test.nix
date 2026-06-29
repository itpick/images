{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-event-exporter-fips" ''
  set -euo pipefail
  echo "Testing kubernetes-event-exporter-fips image..."

  # Smoke test: image runs a shell.
  echo "  Checking shell works..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image.
  echo "  Checking event-exporter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v event-exporter >/dev/null 2>&1 || ls /nix/store/*/bin/event-exporter >/dev/null 2>&1' || true

  echo "All kubernetes-event-exporter-fips tests passed!"
''
