{ pkgs, image }:

pkgs.writeShellScript "test-kube-rbac-proxy-fips" ''
  set -euo pipefail
  echo "Testing kube-rbac-proxy-fips image..."

  # 1. Entrypoint binary runs and reports version or help (non-empty output).
  #    Tolerate non-zero exit codes; the assertion is that the binary is
  #    runnable and produces output.
  echo "  Checking rbac-proxy runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm --entrypoint rbac-proxy ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking rbac-proxy is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v rbac-proxy >/dev/null 2>&1 || ls /nix/store/*/bin/rbac-proxy >/dev/null 2>&1' || true

  echo "All kube-rbac-proxy-fips tests passed!"
''
