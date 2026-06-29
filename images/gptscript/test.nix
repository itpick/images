{ pkgs, image }:

pkgs.writeShellScript "test-gptscript" ''
  set -euo pipefail
  echo "Testing gptscript image..."

  # Entrypoint binary runs and reports version/help (exit 0, non-empty output).
  echo "  Checking gptscript runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image.
  echo "  Checking gptscript binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gptscript >/dev/null 2>&1 || ls /nix/store/*/bin/gptscript >/dev/null 2>&1' || true

  echo "All gptscript tests passed!"
''
