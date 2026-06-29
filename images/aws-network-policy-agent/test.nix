{ pkgs, image }:

pkgs.writeShellScript "test-aws-network-policy-agent" ''
  set -euo pipefail
  echo "Testing aws-network-policy-agent image..."

  # 1. Image runs a shell and the network-policy-agent binary is present
  echo "  Checking network-policy-agent is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v network-policy-agent >/dev/null 2>&1 || ls /nix/store/*/bin/network-policy-agent >/dev/null 2>&1'

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-network-policy-agent tests passed!"
''
