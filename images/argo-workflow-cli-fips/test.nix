{ pkgs, image }:

pkgs.writeShellScript "test-argo-workflow-cli-fips" ''
  set -euo pipefail
  echo "Testing argo-workflow-cli-fips image..."

  # 1. Entry binary runs help and prints non-empty output
  echo "  Checking argo runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking argo is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v argo >/dev/null 2>&1 || ls /nix/store/*/bin/argo >/dev/null 2>&1'

  echo "All argo-workflow-cli-fips tests passed!"
''
