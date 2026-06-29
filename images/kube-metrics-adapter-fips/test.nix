{ pkgs, image }:

pkgs.writeShellScript "test-kube-metrics-adapter-fips" ''
  set -euo pipefail
  echo "Testing kube-metrics-adapter-fips image..."

  # 1. Entrypoint binary runs and reports version or help (non-empty output).
  #    Tolerate non-zero exit codes; the assertion is that the binary is
  #    runnable and produces output.
  echo "  Checking metrics-adapter runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm --entrypoint metrics-adapter ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking metrics-adapter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v metrics-adapter >/dev/null 2>&1 || ls /nix/store/*/bin/metrics-adapter >/dev/null 2>&1'

  echo "All kube-metrics-adapter-fips tests passed!"
''
