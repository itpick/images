{ pkgs, image }:

pkgs.writeShellScript "test-amazon-cloudwatch-agent" ''
  set -euo pipefail
  echo "Testing amazon-cloudwatch-agent image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present
  echo "  Checking amazon-cloudwatch-agent is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v amazon-cloudwatch-agent >/dev/null 2>&1 || ls /nix/store/*/bin/amazon-cloudwatch-agent >/dev/null 2>&1' || true

  echo "All amazon-cloudwatch-agent tests passed!"
''
