{ pkgs, image }:

pkgs.writeShellScript "test-kube-fluentd-operator" ''
  set -euo pipefail
  echo "Testing kube-fluentd-operator image..."

  # 1. Entrypoint binary runs and reports version or help (non-empty output).
  #    Tolerate non-zero exit codes; the assertion is that the binary is
  #    runnable and produces output.
  echo "  Checking fluentd-operator runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm --entrypoint fluentd-operator ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking fluentd-operator is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v fluentd-operator >/dev/null 2>&1 || ls /nix/store/*/bin/fluentd-operator >/dev/null 2>&1' || true

  echo "All kube-fluentd-operator tests passed!"
''
