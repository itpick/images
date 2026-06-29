{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-release-go-runner-fips" ''
  set -euo pipefail
  echo "Testing kubernetes-release-go-runner-fips image..."

  # Smoke test: image runs a shell.
  echo "  Checking shell works..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image.
  echo "  Checking release-go-runner is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v release-go-runner >/dev/null 2>&1 || ls /nix/store/*/bin/release-go-runner >/dev/null 2>&1'

  echo "All kubernetes-release-go-runner-fips tests passed!"
''
