{ pkgs, image }:

pkgs.writeShellScript "test-kyverno-policy-reporter-fips" ''
  set -euo pipefail
  echo "Testing kyverno-policy-reporter-fips image..."

  # Smoke test: image runs a shell (server/controller binary needs runtime args, so
  # we do not invoke it directly). Assert a shell works and the binary is present.
  echo "  Checking image shell + policy-reporter present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v policy-reporter >/dev/null 2>&1 || ls /nix/store/*/bin/policy-reporter >/dev/null 2>&1'

  echo "All kyverno-policy-reporter-fips tests passed!"
''
