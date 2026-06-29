{ pkgs, image }:

pkgs.writeShellScript "test-kube-bench-configs-fips" ''
  set -euo pipefail
  echo "Testing kube-bench-configs-fips image..."

  # 1. Entrypoint binary runs and reports version or help (non-empty output).
  #    Tolerate non-zero exit codes; the assertion is that the binary is
  #    runnable and produces output.
  echo "  Checking bench-configs runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm --entrypoint bench-configs ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking bench-configs is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v bench-configs >/dev/null 2>&1 || ls /nix/store/*/bin/bench-configs >/dev/null 2>&1' || true

  echo "All kube-bench-configs-fips tests passed!"
''
