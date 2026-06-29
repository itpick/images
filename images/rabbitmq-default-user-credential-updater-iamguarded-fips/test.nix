{ pkgs, image }:

pkgs.writeShellScript "test-rabbitmq-default-user-credential-updater-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing rabbitmq-default-user-credential-updater-iamguarded-fips image..."

  # No declared entrypoint and no single CLI; do a minimal smoke test that the
  # image has a working shell and filesystem.
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls / >/dev/null && echo ok' | grep -q ok

  echo "All rabbitmq-default-user-credential-updater-iamguarded-fips tests passed!"
''
