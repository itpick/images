{ pkgs, image }:

pkgs.writeShellScript "test-nvidia-container-toolkit-nvidia-cdi-hook" ''
  set -euo pipefail
  echo "Testing nvidia-container-toolkit-nvidia-cdi-hook image..."

  # This image bundles bash, coreutils and cacert (no standalone CLI),
  # so run a conservative shell smoke test.
  echo "  Checking image shell works..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All nvidia-container-toolkit-nvidia-cdi-hook tests passed!"
''
