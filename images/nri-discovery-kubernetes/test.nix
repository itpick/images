{ pkgs, image }:

pkgs.writeShellScript "test-nri-discovery-kubernetes" ''
  set -euo pipefail
  echo "Testing nri-discovery-kubernetes image..."

  # Image runs a shell and root filesystem is present
  echo "  Checking shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image
  echo "  Checking discovery-kubernetes is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v discovery-kubernetes >/dev/null 2>&1 || ls /nix/store/*/bin/discovery-kubernetes >/dev/null 2>&1'

  echo "All nri-discovery-kubernetes tests passed!"
''
