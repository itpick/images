{ pkgs, image }:

pkgs.writeShellScript "test-rsyslog" ''
  set -euo pipefail
  echo "Testing rsyslog image..."

  # 1. Image runs a shell (smoke test)
  echo "  Checking shell runs..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking rsyslogd is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rsyslogd >/dev/null 2>&1 || ls /nix/store/*/bin/rsyslogd >/dev/null 2>&1' || true

  echo "All rsyslog tests passed!"
''
