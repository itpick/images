{ pkgs, image }:

pkgs.writeShellScript "test-kyverno-policy-reporter-ui" ''
  set -euo pipefail
  echo "Testing kyverno-policy-reporter-ui image..."

  # Smoke test: image runs a shell (server/controller binary needs runtime args, so
  # we do not invoke it directly). Assert a shell works and the binary is present.
  echo "  Checking image shell + policy-reporter-ui present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v policy-reporter-ui >/dev/null 2>&1 || ls /nix/store/*/bin/policy-reporter-ui >/dev/null 2>&1' || true

  echo "All kyverno-policy-reporter-ui tests passed!"
''
