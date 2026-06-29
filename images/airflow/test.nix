{ pkgs, image }:

pkgs.writeShellScript "test-airflow" ''
  set -euo pipefail
  echo "Testing airflow image..."

  # 1. Entry binary reports version and prints non-empty output
  echo "  Checking airflow runs (version)..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking airflow is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v airflow >/dev/null 2>&1 || ls /nix/store/*/bin/airflow >/dev/null 2>&1'

  echo "All airflow tests passed!"
''
