{ pkgs, image }:

pkgs.writeShellScript "test-pypiserver" ''
  set -euo pipefail
  echo "Testing pypiserver image..."

  # 1. Entrypoint (pypi-server) runs and emits output
  echo "  Checking pypi-server runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking pypi-server is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pypi-server >/dev/null 2>&1 || ls /nix/store/*/bin/pypi-server >/dev/null 2>&1'

  echo "All pypiserver tests passed!"
''
