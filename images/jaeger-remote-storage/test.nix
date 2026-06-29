{ pkgs, image }:

pkgs.writeShellScript "test-jaeger-remote-storage" ''
  set -euo pipefail
  echo "Testing jaeger-remote-storage image..."

  # Smoke test: the image starts a shell and the expected binary is present.
  # (jaeger-remote-storage is a long-running server; we avoid guessing version/help flags and
  #  instead verify the image is usable and the entrypoint binary exists.)
  echo "  Checking shell works and jaeger-remote-storage is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v jaeger-remote-storage >/dev/null 2>&1 || ls /nix/store/*/bin/jaeger-remote-storage >/dev/null 2>&1)'

  echo "All jaeger-remote-storage tests passed!"
''
