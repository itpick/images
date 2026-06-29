{ pkgs, image }:

pkgs.writeShellScript "test-gnupg" ''
  set -euo pipefail
  echo "Testing gnupg image..."

  # Entrypoint binary runs and reports version/help (exit 0, non-empty output).
  echo "  Checking gpg runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # Binary present in image.
  echo "  Checking gpg binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gpg >/dev/null 2>&1 || ls /nix/store/*/bin/gpg >/dev/null 2>&1'

  echo "All gnupg tests passed!"
''
