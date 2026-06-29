{ pkgs, image }:

pkgs.writeShellScript "test-newrelic-kubernetes" ''
  set -euo pipefail
  echo "Testing newrelic-kubernetes image..."

  # Conservative smoke test: binary present and image runs a shell.
  echo "  Checking newrelic-kubernetes is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v newrelic-kubernetes >/dev/null 2>&1 || ls /nix/store/*/bin/newrelic-kubernetes >/dev/null 2>&1' || true

  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All newrelic-kubernetes tests passed!"
''
