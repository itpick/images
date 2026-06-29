{ pkgs, image }:

pkgs.writeShellScript "test-gitlab-webservice-ce-fips" ''
  set -euo pipefail
  echo "Testing gitlab-webservice-ce-fips image..."

  # Component image (no dedicated CLI): assert it runs a shell and the rootfs exists.
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All gitlab-webservice-ce-fips tests passed!"
''
