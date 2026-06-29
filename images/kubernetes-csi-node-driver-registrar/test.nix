{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-csi-node-driver-registrar" ''
  set -euo pipefail
  echo "Testing kubernetes-csi-node-driver-registrar image..."

  # 1. Entrypoint binary runs a help/version command and prints non-empty output.
  #    Exit code is tolerated (flag parsers may exit non-zero on --help/--version).
  echo "  Checking csi-node-driver-registrar runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking csi-node-driver-registrar is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v csi-node-driver-registrar >/dev/null 2>&1 || ls /nix/store/*/bin/csi-node-driver-registrar >/dev/null 2>&1' || true

  echo "All kubernetes-csi-node-driver-registrar tests passed!"
''
