{ pkgs, image }:

pkgs.writeShellScript "test-jaeger-operator" ''
  set -euo pipefail
  echo "Testing jaeger-operator image..."

  # Smoke test: the image starts a shell and the expected binary is present.
  # (jaeger-operator is a long-running server; we avoid guessing version/help flags and
  #  instead verify the image is usable and the entrypoint binary exists.)
  echo "  Checking shell works and operator is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v operator >/dev/null 2>&1 || ls /nix/store/*/bin/operator >/dev/null 2>&1)'

  echo "All jaeger-operator tests passed!"
''
