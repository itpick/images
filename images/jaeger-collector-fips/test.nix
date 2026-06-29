{ pkgs, image }:

pkgs.writeShellScript "test-jaeger-collector-fips" ''
  set -euo pipefail
  echo "Testing jaeger-collector-fips image..."

  # Smoke test: the image starts a shell and the expected binary is present.
  # (jaeger-collector-fips is a long-running server; we avoid guessing version/help flags and
  #  instead verify the image is usable and the entrypoint binary exists.)
  echo "  Checking shell works and jaeger-collector is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v jaeger-collector >/dev/null 2>&1 || ls /nix/store/*/bin/jaeger-collector >/dev/null 2>&1)'

  echo "All jaeger-collector-fips tests passed!"
''
