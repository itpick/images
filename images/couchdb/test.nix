{ pkgs, image }:

pkgs.writeShellScript "test-couchdb" ''
  set -euo pipefail
  echo "Testing couchdb image..."

  # 1. Image runs a shell (smoke test; binary is a long-running/argument-driven
  #    process with no reliable version/help one-shot, so we don't invoke it).
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image.
  echo "  Checking couchdb is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v couchdb >/dev/null 2>&1 || ls /nix/store/*/bin/couchdb >/dev/null 2>&1'

  echo "All couchdb tests passed!"
''
