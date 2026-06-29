{ pkgs, image }:

pkgs.writeShellScript "test-jaeger-2-fips-all-in-one" ''
  set -euo pipefail
  echo "Testing jaeger-2-fips-all-in-one image..."

  # Daemon/service: smoke test that a shell runs and the binary is present.
  echo "  Checking shell + 2-fips-all-in-one presence..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v 2-fips-all-in-one >/dev/null 2>&1 || ls /nix/store/*/bin/2-fips-all-in-one >/dev/null 2>&1)'

  echo "All jaeger-2-fips-all-in-one tests passed!"
''
