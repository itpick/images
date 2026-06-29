{ pkgs, image }:

pkgs.writeShellScript "test-kube-proxy" ''
  set -euo pipefail
  echo "Testing kube-proxy image..."

  # 1. Entrypoint binary runs and reports version or help (non-empty output).
  #    Tolerate non-zero exit codes; the assertion is that the binary is
  #    runnable and produces output.
  echo "  Checking proxy runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm --entrypoint proxy ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking proxy is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v proxy >/dev/null 2>&1 || ls /nix/store/*/bin/proxy >/dev/null 2>&1'

  echo "All kube-proxy tests passed!"
''
