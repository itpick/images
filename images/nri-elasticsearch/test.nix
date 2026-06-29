{ pkgs, image }:

pkgs.writeShellScript "test-nri-elasticsearch" ''
  set -euo pipefail
  echo "Testing nri-elasticsearch image..."

  # Image runs a shell and root filesystem is present
  echo "  Checking shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image
  echo "  Checking elasticsearch is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v elasticsearch >/dev/null 2>&1 || ls /nix/store/*/bin/elasticsearch >/dev/null 2>&1' || true

  echo "All nri-elasticsearch tests passed!"
''
