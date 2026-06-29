{ pkgs, image }:

pkgs.writeShellScript "test-jaeger-anonymizer" ''
  set -euo pipefail
  echo "Testing jaeger-anonymizer image..."

  # Smoke test: the image starts a shell and the expected binary is present.
  # (jaeger-anonymizer is a long-running server; we avoid guessing version/help flags and
  #  instead verify the image is usable and the entrypoint binary exists.)
  echo "  Checking shell works and jaeger-anonymizer is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v jaeger-anonymizer >/dev/null 2>&1 || ls /nix/store/*/bin/jaeger-anonymizer >/dev/null 2>&1)'

  echo "All jaeger-anonymizer tests passed!"
''
