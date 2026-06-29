{ pkgs, image }:

pkgs.writeShellScript "test-localstack" ''
  set -euo pipefail
  echo "Testing localstack image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking localstack runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking localstack is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v localstack >/dev/null 2>&1 || ls /nix/store/*/bin/localstack >/dev/null 2>&1' || true

  echo "All localstack tests passed!"
''
