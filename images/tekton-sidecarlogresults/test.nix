{ pkgs, image }:

pkgs.writeShellScript "test-tekton-sidecarlogresults" ''
  set -euo pipefail
  echo "Testing tekton-sidecarlogresults image..."

  # Conservative smoke test: this is a Tekton server/sidecar daemon with no safe
  # version flag, so we only assert the image runs a shell and the tekton-sidecarlogresults binary
  # is present (no daemon invocation that could hang or exit non-zero).
  echo "  Checking shell and root filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "  Checking tekton-sidecarlogresults is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tekton-sidecarlogresults >/dev/null 2>&1 || ls /nix/store/*/bin/tekton-sidecarlogresults >/dev/null 2>&1'

  echo "All tekton-sidecarlogresults tests passed!"
''
