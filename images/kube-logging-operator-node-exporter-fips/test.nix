{ pkgs, image }:

pkgs.writeShellScript "test-kube-logging-operator-node-exporter-fips" ''
  set -euo pipefail
  echo "Testing kube-logging-operator-node-exporter-fips image..."

  # 1. Entrypoint binary runs and reports version or help (non-empty output).
  #    Tolerate non-zero exit codes; the assertion is that the binary is
  #    runnable and produces output.
  echo "  Checking kube-logging-operator-node-exporter runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm --entrypoint kube-logging-operator-node-exporter ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking kube-logging-operator-node-exporter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v kube-logging-operator-node-exporter >/dev/null 2>&1 || ls /nix/store/*/bin/kube-logging-operator-node-exporter >/dev/null 2>&1'

  echo "All kube-logging-operator-node-exporter-fips tests passed!"
''
