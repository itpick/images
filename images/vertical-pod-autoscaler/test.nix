{ pkgs, image }:

pkgs.writeShellScript "test-vertical-pod-autoscaler" ''
  set -euo pipefail
  echo "Testing vertical-pod-autoscaler image..."

  # Smoke test: image runs a shell and the filesystem is intact.
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All vertical-pod-autoscaler tests passed!"
''
