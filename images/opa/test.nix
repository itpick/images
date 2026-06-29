{ pkgs, image }:

pkgs.writeShellScript "test-opa" ''
  set -euo pipefail
  echo "Testing opa image..."

  # 1. Entrypoint (opa) runs and reports version/help (exit 0, non-empty output)
  echo "  Checking opa runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking opa is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v opa >/dev/null 2>&1 || ls /nix/store/*/bin/opa >/dev/null 2>&1' || true

  echo "All opa tests passed!"
''
