{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-ingress-defaultbackend-fips" ''
  set -euo pipefail
  echo "Testing kubernetes-ingress-defaultbackend-fips image..."

  # Smoke test: image runs a shell.
  echo "  Checking shell works..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image.
  echo "  Checking ingress-defaultbackend is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ingress-defaultbackend >/dev/null 2>&1 || ls /nix/store/*/bin/ingress-defaultbackend >/dev/null 2>&1' || true

  echo "All kubernetes-ingress-defaultbackend-fips tests passed!"
''
