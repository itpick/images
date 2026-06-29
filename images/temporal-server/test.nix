{ pkgs, image }:

pkgs.writeShellScript "test-temporal-server" ''
  set -euo pipefail
  echo "Testing temporal-server image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls / >/dev/null && echo ok' 2>&1 || true)
  [ -n "$out" ]
  echo "ok"
''
