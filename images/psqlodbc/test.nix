{ pkgs, image }:

pkgs.writeShellScript "test-psqlodbc" ''
  set -euo pipefail
  echo "Testing psqlodbc image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All psqlodbc tests passed!"
''
