{ pkgs, image }:

pkgs.writeShellScript "test-kuberay-operator-fips" ''
  set -euo pipefail
  echo "Testing kuberay-operator-fips image..."

  # 1. Entrypoint binary runs a help/version command and prints non-empty output.
  #    Exit code is tolerated (flag parsers may exit non-zero on --help/--version).
  echo "  Checking kuberay-operator runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking kuberay-operator is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kuberay-operator >/dev/null 2>&1 || ls /nix/store/*/bin/kuberay-operator >/dev/null 2>&1'

  echo "All kuberay-operator-fips tests passed!"
''
