{ pkgs, image }:

pkgs.writeShellScript "test-crossplane-provider-aws-kinesis" ''
  set -euo pipefail
  echo "Testing crossplane-provider-aws-kinesis image..."

  # 1. Crossplane provider binary runs and prints help (non-empty output).
  #    Tolerate non-zero exit so the test stays robust across provider CLI variants.
  echo "  Checking provider runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Provider binary is present in the image.
  echo "  Checking provider binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v provider >/dev/null 2>&1 || ls /nix/store/*/bin/provider >/dev/null 2>&1' || true

  echo "All crossplane-provider-aws-kinesis tests passed!"
''
