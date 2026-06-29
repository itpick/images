{ pkgs, image }:

pkgs.writeShellScript "test-cert-manager-istio-csr" ''
  set -euo pipefail
  echo "Testing cert-manager-istio-csr image..."

  # Smoke test: image provides a working shell and root filesystem
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All cert-manager-istio-csr tests passed!"
''
