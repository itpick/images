{ pkgs, image }:

pkgs.writeShellScript "test-pdns-recursor" ''
  set -euo pipefail
  echo "Testing pdns-recursor image..."

  # 1. pdns_recursor prints help (exit 0, non-empty output)
  echo "  Checking pdns_recursor --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. pdns_recursor binary present in image
  echo "  Checking pdns_recursor binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pdns_recursor >/dev/null 2>&1 || ls /nix/store/*/bin/pdns_recursor >/dev/null 2>&1'

  echo "All pdns-recursor tests passed!"
''
