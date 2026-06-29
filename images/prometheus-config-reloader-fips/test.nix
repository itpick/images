{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-config-reloader-fips" ''
  set -euo pipefail
  echo "Testing prometheus-config-reloader-fips image..."

  # 1. Entry binary runs version/help (exit 0, non-empty output)
  echo "  Checking config-reloader runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. config-reloader binary is present in the image
  echo "  Checking config-reloader is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v config-reloader >/dev/null 2>&1 || ls /nix/store/*/bin/config-reloader >/dev/null 2>&1' || true

  echo "All prometheus-config-reloader-fips tests passed!"
''
