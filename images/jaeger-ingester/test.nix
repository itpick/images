{ pkgs, image }:

pkgs.writeShellScript "test-jaeger-ingester" ''
  set -euo pipefail
  echo "Testing jaeger-ingester image..."

  # Smoke test: the image starts a shell and the expected binary is present.
  # (jaeger-ingester is a long-running server; we avoid guessing version/help flags and
  #  instead verify the image is usable and the entrypoint binary exists.)
  echo "  Checking shell works and jaeger-ingester is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v jaeger-ingester >/dev/null 2>&1 || ls /nix/store/*/bin/jaeger-ingester >/dev/null 2>&1)'

  echo "All jaeger-ingester tests passed!"
''
