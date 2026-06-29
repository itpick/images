{ pkgs, image }:

pkgs.writeShellScript "test-orthanc" ''
  set -euo pipefail
  echo "Testing orthanc image..."

  # 1. Orthanc reports its version (exit 0, non-empty output)
  echo "  Checking Orthanc --version..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Orthanc binary present in image
  echo "  Checking Orthanc binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v Orthanc >/dev/null 2>&1 || ls /nix/store/*/bin/Orthanc >/dev/null 2>&1'

  echo "All orthanc tests passed!"
''
