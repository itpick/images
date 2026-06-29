{ pkgs, image }:

pkgs.writeShellScript "test-sigstore-scaffolding-tuf-server" ''
  set -euo pipefail
  echo "Testing sigstore-scaffolding-tuf-server image..."

  # Smoke test: image runs a shell and the root filesystem is populated.
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All sigstore-scaffolding-tuf-server tests passed!"
''
