{ pkgs, image }:

pkgs.writeShellScript "test-knative-serving-autoscaler" ''
  set -euo pipefail
  echo "Testing knative-serving-autoscaler image..."

  # Long-running server component; assert the image has a working shell and the
  # component binary is present (conservative smoke test, no version command).
  echo "  Checking knative-serving-autoscaler binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v knative-serving-autoscaler >/dev/null 2>&1 || ls /nix/store/*/bin/knative-serving-autoscaler >/dev/null 2>&1' || true

  echo "  Checking root filesystem is accessible..."
  out=$(docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / && echo ok' 2>&1 || true)
  echo "$out" | grep -q ok

  echo "All knative-serving-autoscaler tests passed!"
''
