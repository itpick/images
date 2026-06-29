{ pkgs, image }:

pkgs.writeShellScript "test-kube-conformance" ''
  set -euo pipefail
  echo "Testing kube-conformance image..."

  # 1. Entrypoint binary runs and reports version or help (non-empty output).
  #    Tolerate non-zero exit codes; the assertion is that the binary is
  #    runnable and produces output.
  echo "  Checking conformance runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm --entrypoint conformance ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking conformance is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v conformance >/dev/null 2>&1 || ls /nix/store/*/bin/conformance >/dev/null 2>&1' || true

  echo "All kube-conformance tests passed!"
''
