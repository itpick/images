{ pkgs, image }:

pkgs.writeShellScript "test-rabbitmq-fips" ''
  set -euo pipefail
  echo "Testing rabbitmq-fips image..."

  # rabbitmq-server is bundled but starting a broker needs a configured node;
  # do a minimal smoke test that the image has a working shell and filesystem,
  # and that the rabbitmq-server binary is present.
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls / >/dev/null && echo ok' | grep -q ok

  echo "  Checking rabbitmq-server is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rabbitmq-server >/dev/null 2>&1 || ls /bin/rabbitmq-server >/dev/null 2>&1 || ls /nix/store/*/bin/rabbitmq-server >/dev/null 2>&1'

  echo "All rabbitmq-fips tests passed!"
''
