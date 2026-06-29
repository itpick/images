{ pkgs, image }:

pkgs.writeShellScript "test-aws-volume-modifier-for-k8s-fips" ''
  set -euo pipefail
  echo "Testing aws-volume-modifier-for-k8s-fips image..."

  # This is a Kubernetes CSI sidecar daemon (no safe one-shot flag). Smoke test:
  # the image runs a shell and the entrypoint binary is present in the image.
  echo "  Checking shell runs and binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v aws-volume-modifier-for-k8s >/dev/null 2>&1 || ls /nix/store/*/bin/aws-volume-modifier-for-k8s >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All aws-volume-modifier-for-k8s-fips tests passed!"
''
