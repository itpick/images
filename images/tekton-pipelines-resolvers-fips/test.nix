{ pkgs, image }:

pkgs.writeShellScript "test-tekton-pipelines-resolvers-fips" ''
  set -euo pipefail
  echo "Testing tekton-pipelines-resolvers-fips image..."

  # Conservative smoke test: this is a Tekton server/sidecar daemon with no safe
  # version flag, so we only assert the image runs a shell and the pipelines-resolvers binary
  # is present (no daemon invocation that could hang or exit non-zero).
  echo "  Checking shell and root filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "  Checking pipelines-resolvers is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pipelines-resolvers >/dev/null 2>&1 || ls /nix/store/*/bin/pipelines-resolvers >/dev/null 2>&1'

  echo "All tekton-pipelines-resolvers-fips tests passed!"
''
