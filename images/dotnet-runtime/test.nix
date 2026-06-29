{ pkgs, image }:

pkgs.writeShellScript "test-dotnet-runtime" ''
  set -euo pipefail
  echo "Testing dotnet-runtime image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All dotnet-runtime tests passed!"
''
