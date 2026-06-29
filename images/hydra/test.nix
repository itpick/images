{ pkgs, image }:

pkgs.writeShellScript "test-hydra" ''
  set -euo pipefail
  echo "Testing hydra image..."

  # hydra-eval-jobs runs and prints help/usage (non-empty output)
  echo "  Checking hydra-eval-jobs runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking hydra-eval-jobs is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v hydra-eval-jobs >/dev/null 2>&1 || ls /nix/store/*/bin/hydra-eval-jobs >/dev/null 2>&1'

  echo "All hydra tests passed!"
''
