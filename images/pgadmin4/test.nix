{ pkgs, image }:

pkgs.writeShellScript "test-pgadmin4" ''
  set -euo pipefail
  echo "Testing pgadmin4 image..."

  # pgadmin4 is a web app whose entrypoint starts a server (no reliable one-shot
  # version flag), so use a conservative smoke test instead of running it.

  # 1. Image runs a shell and the filesystem is intact
  echo "  Checking shell smoke test..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. pgadmin4 binary present in image
  echo "  Checking pgadmin4 binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pgadmin4 >/dev/null 2>&1 || ls /nix/store/*/bin/pgadmin4 >/dev/null 2>&1'

  echo "All pgadmin4 tests passed!"
''
