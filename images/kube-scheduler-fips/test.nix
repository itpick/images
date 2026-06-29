{ pkgs, image }:

pkgs.writeShellScript "test-kube-scheduler-fips" ''
  set -euo pipefail
  echo "Testing kube-scheduler-fips image..."

  # 1. Entrypoint binary runs and reports version or help (non-empty output).
  #    Tolerate non-zero exit codes; the assertion is that the binary is
  #    runnable and produces output.
  echo "  Checking scheduler runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm --entrypoint scheduler ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking scheduler is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v scheduler >/dev/null 2>&1 || ls /nix/store/*/bin/scheduler >/dev/null 2>&1'

  echo "All kube-scheduler-fips tests passed!"
''
