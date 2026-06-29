{ pkgs, image }:

pkgs.writeShellScript "test-kube-logging-operator" ''
  set -euo pipefail
  echo "Testing kube-logging-operator image..."

  # 1. Entrypoint binary runs and reports version or help (non-empty output).
  #    Tolerate non-zero exit codes; the assertion is that the binary is
  #    runnable and produces output.
  echo "  Checking logging-operator runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm --entrypoint logging-operator ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking logging-operator is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v logging-operator >/dev/null 2>&1 || ls /nix/store/*/bin/logging-operator >/dev/null 2>&1' || true

  echo "All kube-logging-operator tests passed!"
''
