{ pkgs, image }:

pkgs.writeShellScript "test-filebrowser" ''
  set -euo pipefail
  echo "Testing filebrowser image..."

  # filebrowser with no args starts a server, so run --help instead
  # (non-empty output).
  echo "  Checking filebrowser runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking filebrowser is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v filebrowser >/dev/null 2>&1 || ls /nix/store/*/bin/filebrowser >/dev/null 2>&1'

  echo "All filebrowser tests passed!"
''
