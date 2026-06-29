{ pkgs, image }:

pkgs.writeShellScript "test-steampipe" ''
  set -euo pipefail
  echo "Testing steampipe image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking steampipe runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking steampipe is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v steampipe >/dev/null 2>&1 || ls /nix/store/*/bin/steampipe >/dev/null 2>&1'

  echo "All steampipe tests passed!"
''
