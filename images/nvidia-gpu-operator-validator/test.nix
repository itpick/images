{ pkgs, image }:

pkgs.writeShellScript "test-nvidia-gpu-operator-validator" ''
  set -euo pipefail
  echo "Testing nvidia-gpu-operator-validator image..."

  # This image bundles only a shell + base tools (no standalone CLI to version-check).
  # Smoke test: the image starts a shell and the root filesystem is present.
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All nvidia-gpu-operator-validator tests passed!"
''
