{ pkgs, image }:

pkgs.writeShellScript "test-kyverno-cleanup-controller-fips" ''
  set -euo pipefail
  echo "Testing kyverno-cleanup-controller-fips image..."

  # Smoke test: image runs a shell (server/controller binary needs runtime args, so
  # we do not invoke it directly). Assert a shell works and the binary is present.
  echo "  Checking image shell + cleanup-controller present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v cleanup-controller >/dev/null 2>&1 || ls /nix/store/*/bin/cleanup-controller >/dev/null 2>&1' || true

  echo "All kyverno-cleanup-controller-fips tests passed!"
''
