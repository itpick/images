{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-kube-apiserver" ''
  set -euo pipefail
  echo "Testing kubernetes-kube-apiserver image..."

  # Smoke test: image built and runs a shell (no reliable version flag for this component).
  echo "  Checking shell works..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All kubernetes-kube-apiserver tests passed!"
''
