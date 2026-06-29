{ pkgs, image }:

pkgs.writeShellScript "test-jaeger-query-fips" ''
  set -euo pipefail
  echo "Testing jaeger-query-fips image..."

  # Smoke test: the image starts a shell and the expected binary is present.
  # (jaeger-query-fips is a long-running server; we avoid guessing version/help flags and
  #  instead verify the image is usable and the entrypoint binary exists.)
  echo "  Checking shell works and jaeger-query is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v jaeger-query >/dev/null 2>&1 || ls /nix/store/*/bin/jaeger-query >/dev/null 2>&1)'

  echo "All jaeger-query-fips tests passed!"
''
