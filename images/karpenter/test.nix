{ pkgs, image }:

pkgs.writeShellScript "test-karpenter" ''
  set -euo pipefail
  echo "Testing karpenter image..."

  # Controller image (entrypoint starts the karpenter controller). Smoke test:
  # shell runs and the karpenter binary is present in the image.
  echo "  Checking shell and karpenter binary are present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v karpenter >/dev/null 2>&1 || ls /nix/store/*/bin/karpenter >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All karpenter tests passed!"
''
