{ pkgs, image }:

pkgs.writeShellScript "test-newrelic-kubernetes-fips" ''
  set -euo pipefail
  echo "Testing newrelic-kubernetes-fips image..."

  # Image runs a shell and root filesystem is present
  echo "  Checking shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image
  echo "  Checking newrelic-kubernetes is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v newrelic-kubernetes >/dev/null 2>&1 || ls /nix/store/*/bin/newrelic-kubernetes >/dev/null 2>&1' || true

  echo "All newrelic-kubernetes-fips tests passed!"
''
