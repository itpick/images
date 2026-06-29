{ pkgs, image }:

pkgs.writeShellScript "test-gitlab-runner-helper-oci-entrypoint-fips" ''
  set -euo pipefail
  echo "Testing gitlab-runner-helper-oci-entrypoint-fips image..."

  # Component image (no dedicated CLI): assert it runs a shell and the rootfs exists.
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All gitlab-runner-helper-oci-entrypoint-fips tests passed!"
''
