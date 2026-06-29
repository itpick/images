{ pkgs, image }:

pkgs.writeShellScript "test-druid" ''
  set -euo pipefail
  echo "Testing druid image..."

  # druid's entrypoint (start-druid) launches a long-running cluster, so we do
  # not invoke it directly. Smoke test: the image runs a shell and the
  # start-druid binary is present.
  echo "  Checking image shell + start-druid binary..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v start-druid >/dev/null 2>&1 || ls /nix/store/*/bin/start-druid >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All druid tests passed!"
''
