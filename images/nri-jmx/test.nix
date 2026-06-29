{ pkgs, image }:

pkgs.writeShellScript "test-nri-jmx" ''
  set -euo pipefail
  echo "Testing nri-jmx image..."

  # NRI plugins are New Relic on-host integration binaries that connect to a
  # service when run; assert the plugin binary and a working shell are present.

  # 1. Plugin binary present in image (entrypoint targets this binary)
  echo "  Checking jmx binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls /nix/store/*/bin/jmx >/dev/null 2>&1 && echo ok' | grep -q ok

  # 2. Image shell smoke test
  echo "  Checking image shell works..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All nri-jmx tests passed!"
''
