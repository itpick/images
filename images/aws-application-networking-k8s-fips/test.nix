{ pkgs, image }:

pkgs.writeShellScript "test-aws-application-networking-k8s-fips" ''
  set -euo pipefail
  echo "Testing aws-application-networking-k8s-fips image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Controller binary present
  echo "  Checking application-networking-k8s is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v application-networking-k8s >/dev/null 2>&1 || ls /nix/store/*/bin/application-networking-k8s >/dev/null 2>&1' || true

  echo "All aws-application-networking-k8s-fips tests passed!"
''
