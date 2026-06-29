{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-reflector-fips" ''
  set -euo pipefail
  echo "Testing kubernetes-reflector-fips image..."

  # Smoke test: image built and runs a shell (no reliable version flag for this component).
  echo "  Checking shell works..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All kubernetes-reflector-fips tests passed!"
''
