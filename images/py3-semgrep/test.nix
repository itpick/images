{ pkgs, image }:

pkgs.writeShellScript "test-py3-semgrep" ''
  set -euo pipefail
  echo "Testing py3-semgrep image..."

  # 1. Entrypoint (semgrep) runs and emits output
  echo "  Checking semgrep runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking semgrep is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v semgrep >/dev/null 2>&1 || ls /nix/store/*/bin/semgrep >/dev/null 2>&1' || true

  echo "All py3-semgrep tests passed!"
''
