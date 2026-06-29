{ pkgs, image }:

pkgs.writeShellScript "test-kyverno-policy-reporter-plugins-kyverno" ''
  set -euo pipefail
  echo "Testing kyverno-policy-reporter-plugins-kyverno image..."

  # Smoke test: image runs a shell (server/controller binary needs runtime args, so
  # we do not invoke it directly). Assert a shell works and the binary is present.
  echo "  Checking image shell + policy-reporter-plugins-kyverno present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v policy-reporter-plugins-kyverno >/dev/null 2>&1 || ls /nix/store/*/bin/policy-reporter-plugins-kyverno >/dev/null 2>&1'

  echo "All kyverno-policy-reporter-plugins-kyverno tests passed!"
''
