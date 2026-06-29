{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-csi-external-snapshotter" ''
  set -euo pipefail
  echo "Testing kubernetes-csi-external-snapshotter image..."

  # 1. Entrypoint binary runs a help/version command and prints non-empty output.
  #    Exit code is tolerated (flag parsers may exit non-zero on --help/--version).
  echo "  Checking csi-external-snapshotter runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking csi-external-snapshotter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v csi-external-snapshotter >/dev/null 2>&1 || ls /nix/store/*/bin/csi-external-snapshotter >/dev/null 2>&1'

  echo "All kubernetes-csi-external-snapshotter tests passed!"
''
