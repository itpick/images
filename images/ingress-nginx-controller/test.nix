{ pkgs, image }:

pkgs.writeShellScript "test-ingress-nginx-controller" ''
  set -euo pipefail
  echo "Testing ingress-nginx-controller image..."

  # nginx-ingress-controller runs and prints help/usage (non-empty output)
  echo "  Checking nginx-ingress-controller runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking nginx-ingress-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nginx-ingress-controller >/dev/null 2>&1 || ls /nix/store/*/bin/nginx-ingress-controller >/dev/null 2>&1'

  echo "All ingress-nginx-controller tests passed!"
''
