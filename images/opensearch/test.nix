{ pkgs, image }:

pkgs.writeShellScript "test-opensearch" ''
  set -euo pipefail
  echo "Testing opensearch image..."

  # Smoke test: the server runs indefinitely, so verify the image runs a shell
  # and the opensearch binary is present rather than starting the server.
  echo "  Checking shell and opensearch are present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && command -v opensearch >/dev/null 2>&1 && echo ok' | grep -q ok

  echo "All opensearch tests passed!"
''
