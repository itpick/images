{ pkgs, image }:

pkgs.writeShellScript "test-nvidia-container-toolkit-nvidia-container-runtime" ''
  set -euo pipefail
  echo "Testing nvidia-container-toolkit-nvidia-container-runtime image..."

  # This image bundles only a shell + base tools (no standalone CLI to version-check).
  # Smoke test: the image starts a shell and the root filesystem is present.
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All nvidia-container-toolkit-nvidia-container-runtime tests passed!"
''
