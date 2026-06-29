{ pkgs, image }:

pkgs.writeShellScript "test-openldap-2.6-clients" ''
  set -euo pipefail
  echo "Testing openldap-2.6-clients image..."

  # Smoke test: image runs a shell and the ldapsearch client is present
  echo "  Checking shell and ldapsearch are present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && command -v ldapsearch >/dev/null 2>&1 && echo ok' | grep -q ok

  echo "All openldap-2.6-clients tests passed!"
''
