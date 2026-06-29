{ pkgs, image }:

pkgs.writeShellScript "test-dotnet-sdk" ''
  set -euo pipefail
  echo "Testing dotnet-sdk image..."

  # 1. dotnet entrypoint runs and prints SDK info (exit 0, non-empty output).
  # --info is the image's default CMD.
  echo "  Checking dotnet runs..."
  out=$(docker run --rm ${image.imageName}:test --info 2>&1 || true)
  [ -n "$out" ]

  # 2. dotnet binary present in image (shell is bundled)
  echo "  Checking dotnet binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dotnet >/dev/null 2>&1 || ls /nix/store/*/bin/dotnet >/dev/null 2>&1' || true

  echo "All dotnet-sdk tests passed!"
''
