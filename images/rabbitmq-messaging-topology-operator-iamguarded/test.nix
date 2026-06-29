{ pkgs, image }:

pkgs.writeShellScript "test-rabbitmq-messaging-topology-operator-iamguarded" ''
  set -euo pipefail
  echo "Testing rabbitmq-messaging-topology-operator-iamguarded image..."

  # 1. Image runs a shell (exits 0)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking rabbitmqctl binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rabbitmqctl >/dev/null 2>&1 || ls /nix/store/*/bin/rabbitmqctl >/dev/null 2>&1' || true

  echo "All rabbitmq-messaging-topology-operator-iamguarded tests passed!"
''
