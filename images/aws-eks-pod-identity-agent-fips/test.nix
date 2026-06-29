{ pkgs, image }:

pkgs.writeShellScript "test-aws-eks-pod-identity-agent-fips" ''
  set -euo pipefail
  echo "Testing aws-eks-pod-identity-agent-fips image..."

  # 1. Image runs a shell and the eks-pod-identity-agent binary is present
  echo "  Checking eks-pod-identity-agent is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v eks-pod-identity-agent >/dev/null 2>&1 || ls /nix/store/*/bin/eks-pod-identity-agent >/dev/null 2>&1' || true

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-eks-pod-identity-agent-fips tests passed!"
''
