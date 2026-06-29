{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-secret-generator" ''
  set -euo pipefail
  echo "Testing kubernetes-secret-generator image..."

  # Smoke test: image runs a shell.
  echo "  Checking shell works..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image.
  echo "  Checking secret-generator is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v secret-generator >/dev/null 2>&1 || ls /nix/store/*/bin/secret-generator >/dev/null 2>&1'

  echo "All kubernetes-secret-generator tests passed!"
''
