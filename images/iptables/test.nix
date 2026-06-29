{ pkgs, image }:

pkgs.writeShellScript "test-iptables" ''
  set -euo pipefail
  echo "Testing iptables image..."

  # iptables runs and prints version/help (non-empty output)
  echo "  Checking iptables runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking iptables is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v iptables >/dev/null 2>&1 || ls /nix/store/*/bin/iptables >/dev/null 2>&1'

  echo "All iptables tests passed!"
''
