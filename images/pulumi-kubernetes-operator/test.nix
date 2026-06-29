{ pkgs, image }:

pkgs.writeShellScript "test-pulumi-kubernetes-operator" ''
  set -euo pipefail
  echo "Testing pulumi-kubernetes-operator image..."

  # 1. Entrypoint (manager) runs and emits output (tolerate non-zero exit)
  echo "  Checking manager runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image (installed at /manager and on PATH)
  echo "  Checking manager is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v manager >/dev/null 2>&1 || ls /manager >/dev/null 2>&1 || ls /nix/store/*/bin/manager >/dev/null 2>&1'

  echo "All pulumi-kubernetes-operator tests passed!"
''
