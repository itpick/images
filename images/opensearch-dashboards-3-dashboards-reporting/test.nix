{ pkgs, image }:

pkgs.writeShellScript "test-opensearch-dashboards-3-dashboards-reporting" ''
  set -euo pipefail
  echo "Testing opensearch-dashboards-3-dashboards-reporting image..."

  # Smoke test: image runs a shell and the bundled opensearch binary is present.
  # (The server runs indefinitely, so we do not start it.)
  echo "  Checking shell and opensearch are present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && command -v opensearch >/dev/null 2>&1 && echo ok' | grep -q ok

  echo "All opensearch-dashboards-3-dashboards-reporting tests passed!"
''
