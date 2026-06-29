{ pkgs, image }:

pkgs.writeShellScript "test-argo-exec" ''
  set -euo pipefail
  echo "Testing argo-exec image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Executor binary present
  echo "  Checking argoexec is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v argoexec >/dev/null 2>&1 || ls /nix/store/*/bin/argoexec >/dev/null 2>&1'

  echo "All argo-exec tests passed!"
''
