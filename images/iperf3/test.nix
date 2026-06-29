{ pkgs, image }:

pkgs.writeShellScript "test-iperf3" ''
  set -euo pipefail
  echo "Testing iperf3 image..."

  # iperf3 runs and prints version/help (non-empty output)
  echo "  Checking iperf3 runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking iperf3 is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v iperf3 >/dev/null 2>&1 || ls /nix/store/*/bin/iperf3 >/dev/null 2>&1'

  echo "All iperf3 tests passed!"
''
