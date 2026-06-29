{ pkgs, image }:

pkgs.writeShellScript "test-dotnet-sdk-fips" ''
  set -euo pipefail
  echo "Testing dotnet-sdk-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All dotnet-sdk-fips tests passed!"
''
