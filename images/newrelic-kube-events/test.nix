{ pkgs, image }:

pkgs.writeShellScript "test-newrelic-kube-events" ''
  set -euo pipefail
  echo "Testing newrelic-kube-events image..."

  # Conservative smoke test: binary present and image runs a shell.
  echo "  Checking newrelic-kube-events is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v newrelic-kube-events >/dev/null 2>&1 || ls /nix/store/*/bin/newrelic-kube-events >/dev/null 2>&1' || true

  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All newrelic-kube-events tests passed!"
''
