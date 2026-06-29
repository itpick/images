{ pkgs, image }:

pkgs.writeShellScript "test-jaeger-es-rollover-fips" ''
  set -euo pipefail
  echo "Testing jaeger-es-rollover-fips image..."

  # Smoke test: the image starts a shell and the expected binary is present.
  # (jaeger-es-rollover-fips is a long-running server; we avoid guessing version/help flags and
  #  instead verify the image is usable and the entrypoint binary exists.)
  echo "  Checking shell works and jaeger-es-rollover is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v jaeger-es-rollover >/dev/null 2>&1 || ls /nix/store/*/bin/jaeger-es-rollover >/dev/null 2>&1)'

  echo "All jaeger-es-rollover-fips tests passed!"
''
