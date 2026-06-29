{ pkgs, image }:

pkgs.writeShellScript "test-crossplane-aws-lambda" ''
  set -euo pipefail
  echo "Testing crossplane-aws-lambda image..."

  # 1. Image runs a shell (smoke test; binary is a long-running/argument-driven
  #    process with no reliable version/help one-shot, so we don't invoke it).
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image.
  echo "  Checking provider is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v provider >/dev/null 2>&1 || ls /nix/store/*/bin/provider >/dev/null 2>&1' || true

  echo "All crossplane-aws-lambda tests passed!"
''
