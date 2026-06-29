{ pkgs, image }:

pkgs.writeShellScript "test-jaeger-2-fips-ingester" ''
  set -euo pipefail
  echo "Testing jaeger-2-fips-ingester image..."

  # Smoke test: the image starts a shell and the expected binary is present.
  # (jaeger-2-fips-ingester is a long-running server; we avoid guessing version/help flags and
  #  instead verify the image is usable and the entrypoint binary exists.)
  echo "  Checking shell works and 2-fips-ingester is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v 2-fips-ingester >/dev/null 2>&1 || ls /nix/store/*/bin/2-fips-ingester >/dev/null 2>&1)'

  echo "All jaeger-2-fips-ingester tests passed!"
''
