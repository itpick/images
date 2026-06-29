{ pkgs, image }:

pkgs.writeShellScript "test-google-cloud-sdk" ''
  set -euo pipefail
  echo "Testing google-cloud-sdk image..."

  # Entrypoint binary runs and reports version/help (exit 0, non-empty output).
  echo "  Checking gcloud runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1)
  [ -n "$out" ]

  # Binary present in image.
  echo "  Checking gcloud binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gcloud >/dev/null 2>&1 || ls /nix/store/*/bin/gcloud >/dev/null 2>&1'

  echo "All google-cloud-sdk tests passed!"
''
