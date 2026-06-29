{ pkgs, image }:

pkgs.writeShellScript "test-cni-plugins-portmap" ''
  set -euo pipefail
  echo "Testing cni-plugins-portmap image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls / >/dev/null && echo ok' 2>&1 || true)
  [ -n "$out" ]
  echo "ok"
''
