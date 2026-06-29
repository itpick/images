{ pkgs, image }:

pkgs.writeShellScript "test-tekton-nop-fips" ''
  set -euo pipefail
  echo "Testing tekton-nop-fips image..."

  # Conservative smoke test: this is a Tekton server/sidecar daemon with no safe
  # version flag, so we only assert the image runs a shell and the tekton-nop binary
  # is present (no daemon invocation that could hang or exit non-zero).
  echo "  Checking shell and root filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "  Checking tekton-nop is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tekton-nop >/dev/null 2>&1 || ls /nix/store/*/bin/tekton-nop >/dev/null 2>&1'

  echo "All tekton-nop-fips tests passed!"
''
