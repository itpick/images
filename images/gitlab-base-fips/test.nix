{ pkgs, image }:

pkgs.writeShellScript "test-gitlab-base-fips" ''
  set -euo pipefail
  echo "Testing gitlab-base-fips image..."

  # Image runs a shell and root filesystem is readable
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/bash ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All gitlab-base-fips tests passed!"
''
