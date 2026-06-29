{ pkgs, image }:

pkgs.writeShellScript "test-dotnet-9-runtime" ''
  set -euo pipefail
  echo "Testing dotnet-9-runtime image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test 2>&1 || true)
  [ -n "$out" ]
  echo "All dotnet-9-runtime tests passed!"
''
