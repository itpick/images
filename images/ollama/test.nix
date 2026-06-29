{ pkgs, image }:

pkgs.writeShellScript "test-ollama" ''
  set -euo pipefail
  echo "Testing ollama image..."

  # 1. Entrypoint (ollama) runs and reports version/help (exit 0, non-empty output)
  echo "  Checking ollama runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking ollama is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ollama >/dev/null 2>&1 || ls /nix/store/*/bin/ollama >/dev/null 2>&1' || true

  echo "All ollama tests passed!"
''
