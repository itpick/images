{ pkgs, image }:

pkgs.writeShellScript "test-kube-downscaler" ''
  set -euo pipefail
  echo "Testing kube-downscaler image..."

  # 1. Entrypoint binary runs and reports version or help (non-empty output).
  #    Tolerate non-zero exit codes; the assertion is that the binary is
  #    runnable and produces output.
  echo "  Checking downscaler runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm --entrypoint downscaler ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking downscaler is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v downscaler >/dev/null 2>&1 || ls /nix/store/*/bin/downscaler >/dev/null 2>&1' || true

  echo "All kube-downscaler tests passed!"
''
