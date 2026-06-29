{ pkgs, image }:

pkgs.writeShellScript "test-rabbitmq-cluster-operator-iamguarded" ''
  set -euo pipefail
  echo "Testing rabbitmq-cluster-operator-iamguarded image..."

  # No declared entrypoint and no single operator CLI; do a minimal smoke test
  # that the image has a working shell and filesystem.
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls / >/dev/null && echo ok' | grep -q ok

  echo "All rabbitmq-cluster-operator-iamguarded tests passed!"
''
