{ pkgs, image }:

pkgs.writeShellScript "test-malcontent" ''
  set -euo pipefail
  echo "Testing malcontent image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking malcontent-client runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking malcontent-client is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v malcontent-client >/dev/null 2>&1 || ls /nix/store/*/bin/malcontent-client >/dev/null 2>&1'

  echo "All malcontent tests passed!"
''
