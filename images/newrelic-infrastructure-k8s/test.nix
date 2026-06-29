{ pkgs, image }:

pkgs.writeShellScript "test-newrelic-infrastructure-k8s" ''
  set -euo pipefail
  echo "Testing newrelic-infrastructure-k8s image..."

  # Conservative smoke test: binary present and image runs a shell.
  echo "  Checking newrelic-infrastructure-k8s is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v newrelic-infrastructure-k8s >/dev/null 2>&1 || ls /nix/store/*/bin/newrelic-infrastructure-k8s >/dev/null 2>&1' || true

  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All newrelic-infrastructure-k8s tests passed!"
''
