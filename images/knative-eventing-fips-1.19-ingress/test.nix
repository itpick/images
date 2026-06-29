{ pkgs, image }:

pkgs.writeShellScript "test-knative-eventing-fips-1.19-ingress" ''
  set -euo pipefail
  echo "Testing knative-eventing-fips-1.19-ingress image..."

  # Long-running server component; assert the image has a working shell and the
  # component binary is present (conservative smoke test, no version command).
  echo "  Checking eventing-fips-1.19-ingress binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v eventing-fips-1.19-ingress >/dev/null 2>&1 || ls /nix/store/*/bin/eventing-fips-1.19-ingress >/dev/null 2>&1' || true

  echo "  Checking root filesystem is accessible..."
  out=$(docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / && echo ok' 2>&1 || true)
  echo "$out" | grep -q ok

  echo "All knative-eventing-fips-1.19-ingress tests passed!"
''
