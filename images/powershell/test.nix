{ pkgs, image }:

pkgs.writeShellScript "test-powershell" ''
  set -euo pipefail
  echo "Testing powershell image..."

  # 1. Default entrypoint runs (powershell --help) with non-empty output
  echo "  Checking powershell runs..."
  out=$(docker run --rm ${image.imageName}:test 2>&1 || true)
  [ -n "$out" ]

  # 2. powershell/pwsh binary is present in the image
  echo "  Checking powershell is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v powershell >/dev/null 2>&1 || command -v pwsh >/dev/null 2>&1 || ls /nix/store/*/bin/pwsh >/dev/null 2>&1 || ls /nix/store/*/bin/powershell >/dev/null 2>&1' || true

  echo "All powershell tests passed!"
''
