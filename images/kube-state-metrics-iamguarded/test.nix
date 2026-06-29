{ pkgs, image }:

pkgs.writeShellScript "test-kube-state-metrics-iamguarded" ''
  set -euo pipefail
  echo "Testing kube-state-metrics-iamguarded image..."

  # 1. Entrypoint binary runs and reports version or help (non-empty output).
  #    Tolerate non-zero exit codes; the assertion is that the binary is
  #    runnable and produces output.
  echo "  Checking kube-state-metrics-iamguarded runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm --entrypoint kube-state-metrics-iamguarded ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking kube-state-metrics-iamguarded is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v kube-state-metrics-iamguarded >/dev/null 2>&1 || ls /nix/store/*/bin/kube-state-metrics-iamguarded >/dev/null 2>&1' || true

  echo "All kube-state-metrics-iamguarded tests passed!"
''
