{ pkgs, image }:

pkgs.writeShellScript "test-jetty" ''
  set -euo pipefail
  echo "Testing jetty image..."

  # Server image (entrypoint starts Jetty). Smoke test: shell runs and the
  # jetty launcher script is present in the image.
  echo "  Checking shell and jetty.sh are present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v jetty.sh >/dev/null 2>&1 || ls /nix/store/*/bin/jetty.sh >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All jetty tests passed!"
''
