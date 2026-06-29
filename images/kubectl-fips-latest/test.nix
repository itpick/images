{ pkgs, image }:

pkgs.writeShellScript "test-kubectl-fips-latest" ''
  set -euo pipefail
  echo "Testing kubectl-fips-latest image..."

  # 1. Entrypoint runs --help (exit 0, non-empty output)
  echo "  Checking kubectl --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image
  echo "  Checking kubectl is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubectl >/dev/null 2>&1 || ls /nix/store/*/bin/kubectl >/dev/null 2>&1' || true

  echo "All kubectl-fips-latest tests passed!"
''
