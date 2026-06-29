{ pkgs, image }:

pkgs.writeShellScript "test-ntpd-rs" ''
  set -euo pipefail
  echo "Testing ntpd-rs image..."

  # 1. Entrypoint (ntp-daemon) runs help and prints non-empty output
  echo "  Checking ntp-daemon runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking ntp-daemon binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls /nix/store/*/bin/ntp-daemon >/dev/null 2>&1 && echo ok' | grep -q ok

  echo "All ntpd-rs tests passed!"
''
