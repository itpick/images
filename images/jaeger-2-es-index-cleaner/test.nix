{ pkgs, image }:

pkgs.writeShellScript "test-jaeger-2-es-index-cleaner" ''
  set -euo pipefail
  echo "Testing jaeger-2-es-index-cleaner image..."

  # Daemon/service: smoke test that a shell runs and the binary is present.
  echo "  Checking shell + 2-es-index-cleaner presence..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v 2-es-index-cleaner >/dev/null 2>&1 || ls /nix/store/*/bin/2-es-index-cleaner >/dev/null 2>&1)'

  echo "All jaeger-2-es-index-cleaner tests passed!"
''
