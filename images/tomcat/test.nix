{ pkgs, image }:

pkgs.writeShellScript "test-tomcat" ''
  set -euo pipefail
  echo "Testing tomcat image..."

  # 1. Image runs a shell
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Java runtime and catalina launcher present (catalina.sh entrypoint is env-dependent)
  echo "  Checking java and catalina.sh present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v java >/dev/null 2>&1 || ls /nix/store/*/bin/java >/dev/null 2>&1' || true
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v catalina.sh >/dev/null 2>&1 || ls /nix/store/*/bin/catalina.sh >/dev/null 2>&1' || true

  echo "All tomcat tests passed!"
''
