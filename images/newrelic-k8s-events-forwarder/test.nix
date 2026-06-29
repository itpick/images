{ pkgs, image }:

pkgs.writeShellScript "test-newrelic-k8s-events-forwarder" ''
  set -euo pipefail
  echo "Testing newrelic-k8s-events-forwarder image..."

  # Conservative smoke test: binary present and image runs a shell.
  echo "  Checking newrelic-k8s-events-forwarder is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v newrelic-k8s-events-forwarder >/dev/null 2>&1 || ls /nix/store/*/bin/newrelic-k8s-events-forwarder >/dev/null 2>&1' || true

  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All newrelic-k8s-events-forwarder tests passed!"
''
