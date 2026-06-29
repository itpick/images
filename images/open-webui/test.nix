{ pkgs, image }:

pkgs.writeShellScript "test-open-webui" ''
  set -euo pipefail
  echo "Testing open-webui image..."

  # 1. Entrypoint (open-webui) runs and reports version/help (exit 0, non-empty output)
  echo "  Checking open-webui runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking open-webui is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v open-webui >/dev/null 2>&1 || ls /nix/store/*/bin/open-webui >/dev/null 2>&1'

  echo "All open-webui tests passed!"
''
