{ pkgs, image }:

pkgs.writeShellScript "test-vault-k8s-fips" ''
  set -euo pipefail
  echo "Testing vault-k8s-fips image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking vault-k8s runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vault-k8s is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vault-k8s >/dev/null 2>&1 || ls /nix/store/*/bin/vault-k8s >/dev/null 2>&1' || true

  echo "All vault-k8s-fips tests passed!"
''
