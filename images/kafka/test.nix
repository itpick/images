{ pkgs, image }:

pkgs.writeShellScript "test-kafka" ''
  set -euo pipefail
  echo "Testing kafka image..."

  # Server image (entrypoint starts the Kafka broker). Smoke test: shell runs
  # and the kafka start script is present in the image.
  echo "  Checking shell and kafka-server-start.sh are present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v kafka-server-start.sh >/dev/null 2>&1 || ls /nix/store/*/bin/kafka-server-start.sh >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All kafka tests passed!"
''
