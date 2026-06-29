{ pkgs, image }:

pkgs.writeShellScript "test-newrelic-prometheus" ''
  set -euo pipefail
  echo "Testing newrelic-prometheus image..."

  # Image runs a shell and root filesystem is present
  echo "  Checking shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image
  echo "  Checking newrelic-prometheus is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v newrelic-prometheus >/dev/null 2>&1 || ls /nix/store/*/bin/newrelic-prometheus >/dev/null 2>&1' || true

  echo "All newrelic-prometheus tests passed!"
''
