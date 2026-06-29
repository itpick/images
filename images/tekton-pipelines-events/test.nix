{ pkgs, image }:

pkgs.writeShellScript "test-tekton-pipelines-events" ''
  set -euo pipefail
  echo "Testing tekton-pipelines-events image..."

  # Conservative smoke test: this is a Tekton server/sidecar daemon with no safe
  # version flag, so we only assert the image runs a shell and the pipelines-events binary
  # is present (no daemon invocation that could hang or exit non-zero).
  echo "  Checking shell and root filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "  Checking pipelines-events is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pipelines-events >/dev/null 2>&1 || ls /nix/store/*/bin/pipelines-events >/dev/null 2>&1'

  echo "All tekton-pipelines-events tests passed!"
''
