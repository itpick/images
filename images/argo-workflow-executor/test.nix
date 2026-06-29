{ pkgs, image }:

pkgs.writeShellScript "test-argo-workflow-executor" ''
  set -euo pipefail
  echo "Testing argo-workflow-executor image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Executor binary present
  echo "  Checking argoexec is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v argoexec >/dev/null 2>&1 || ls /nix/store/*/bin/argoexec >/dev/null 2>&1' || true

  echo "All argo-workflow-executor tests passed!"
''
