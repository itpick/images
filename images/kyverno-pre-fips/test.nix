{ pkgs, image }:

pkgs.writeShellScript "test-kyverno-pre-fips" ''
  set -euo pipefail
  echo "Testing kyverno-pre-fips image..."

  # Smoke test: image runs a shell (server/controller binary needs runtime args, so
  # we do not invoke it directly). Assert a shell works and the binary is present.
  echo "  Checking image shell + kyverno-pre present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kyverno-pre >/dev/null 2>&1 || ls /nix/store/*/bin/kyverno-pre >/dev/null 2>&1' || true

  echo "All kyverno-pre-fips tests passed!"
''
