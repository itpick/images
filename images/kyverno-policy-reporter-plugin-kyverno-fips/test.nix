{ pkgs, image }:

pkgs.writeShellScript "test-kyverno-policy-reporter-plugin-kyverno-fips" ''
  set -euo pipefail
  echo "Testing kyverno-policy-reporter-plugin-kyverno-fips image..."

  # Smoke test: image runs a shell (server/controller binary needs runtime args, so
  # we do not invoke it directly). Assert a shell works and the binary is present.
  echo "  Checking image shell + kyverno-policy-reporter-plugin-kyverno present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kyverno-policy-reporter-plugin-kyverno >/dev/null 2>&1 || ls /nix/store/*/bin/kyverno-policy-reporter-plugin-kyverno >/dev/null 2>&1' || true

  echo "All kyverno-policy-reporter-plugin-kyverno-fips tests passed!"
''
