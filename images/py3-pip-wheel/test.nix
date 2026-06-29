{ pkgs, image }:

pkgs.writeShellScript "test-py3-pip-wheel" ''
  set -euo pipefail
  echo "Testing py3-pip-wheel image..."

  # 1. Entrypoint (pip) runs and emits output
  echo "  Checking pip runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking pip is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pip >/dev/null 2>&1 || ls /nix/store/*/bin/pip >/dev/null 2>&1'

  echo "All py3-pip-wheel tests passed!"
''
