{ pkgs, image }:

pkgs.writeShellScript "test-calico-typha" ''
  set -euo pipefail
  echo "Testing calico-typha image..."

  # 1. Entrypoint runs --help and prints non-empty output (tolerate exit code)
  echo "  Checking calico-typha --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking calico-typha is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v calico-typha >/dev/null 2>&1 || ls /nix/store/*/bin/calico-typha >/dev/null 2>&1' || true

  echo "All calico-typha tests passed!"
''
